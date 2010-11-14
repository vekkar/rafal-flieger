using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;

namespace Wyszukiwarka
{
	public class Dokument
	{
		public string NaglowekOryginal { get; set; }
		public string TrescOryginal { get; set; }
		public string NaglowekStemming { get; set; }
		public string TrescStemming { get; set; }

		/// <summary>
		/// Coś co chcemy obliczyć
		/// </summary>
		public double MiaraPrawdopodobienstwa { get; set; }

		/// <summary>
		/// Lista termów
		/// UWAGA: poprawnie wypełnione są tylko TermStemming
		/// UWAGA 2: Termy pochodzą z tytułu i z treści dokumentu!
		/// </summary>
		public List<Term> Termy { get; set; }

		/// <summary>
		/// Wektor dla reprezentacji bag of words
		/// </summary>
		public Dictionary<string, int> BagOfWordsVect { get; set; }

		/// <summary>
		/// Wektor dla reprezentacji Term Frequency
		/// </summary>
		public Dictionary<string, double> TermFrequencyVect { get; set; }

		/// <summary>
		/// Wektor dla reprezentacji binarnej, Term Frequency i Inverse Document Frequency
		/// </summary>
		public Dictionary<string, double> TFIDFVect { get; set; }

		public Dokument()
		{
			this.Termy = new List<Term>();
			this.MiaraPrawdopodobienstwa = 0.0;
		}

		/// <summary>
		/// Wypełnia wektory BOW, TF i TFIDF na podstawie zapytania.
		/// (Kolumny są w kolejności takiej jak termy w zapytaniu)
		/// </summary>
		public void WypelnijWektory(List<Term> wszystkieTermy, Dictionary<string, double> idfVect)
		{
			// sortujemy
			this.Termy.Sort((x, y) => x.TermStemming.CompareTo(y.TermStemming));

			this.BagOfWordsVect = new Dictionary<string, int>();
			this.TermFrequencyVect = new Dictionary<string, double>();
			this.TFIDFVect = new Dictionary<string, double>();

			// Bag of words
			foreach (Term t in wszystkieTermy)
			{
				this.BagOfWordsVect[t.TermStemming] = this.IleWZapytaniu(t);
			}

			// TF
			this.TermFrequencyVect = this.LiczTFzBOW(this.BagOfWordsVect);

			// TFIDF
			foreach (var item in this.TermFrequencyVect)
			{
				this.TFIDFVect[item.Key] = this.TermFrequencyVect[item.Key] * idfVect[item.Key];
			}
		}

		/// <summary>
		/// Wypełnia wektory BOW, TF i TFIDF na podstawie zapytania. Liczy też ostateczne prawdopodobienstwo.
		/// (Kolumny są w kolejności takiej jak termy w zapytaniu)
		/// </summary>
		public void WypelnijWektory(List<Term> wszystkieTermy, Dokument zapytanie, Dictionary<string, double> idfVect)
		{
			this.WypelnijWektory(wszystkieTermy, idfVect);

			// similarity todo
			this.MiaraPrawdopodobienstwa = this.LiczPrawdopodobienstwo(zapytanie);
		}

		private double LiczPrawdopodobienstwo(Dokument zapytanie)
		{
			double sumaIlocz = 0.0;
			foreach (var item in zapytanie.TFIDFVect)
			{
				sumaIlocz += zapytanie.TFIDFVect[item.Key] * this.TFIDFVect[item.Key];
			}

			double dlugoscZap = this.LiczDlugoscWektora(zapytanie.TFIDFVect);
			double dlugoscDok = this.LiczDlugoscWektora(this.TFIDFVect);
			if (dlugoscDok == 0 || dlugoscZap == 0)
			{
				return -1; // not available
			}
			return sumaIlocz / (dlugoscZap * dlugoscDok);
		}

		private double LiczDlugoscWektora(Dictionary<string, double> v)
		{
			double sum = 0;
			foreach (var item in v)
			{
				sum += item.Value * item.Value;
			}
			return Math.Sqrt(sum);
		}

		/// <summary>
		/// Liczy wektor TF na podstawie podanego bagofwords
		/// </summary>
		private Dictionary<string, double> LiczTFzBOW(Dictionary<string, int> bow)
		{
			Dictionary<string, double> tfv = new Dictionary<string, double>();
			double maks = 0;
			foreach (var item in bow)
			{
				if (item.Value > maks)
				{
					maks = item.Value;
				}
			}
			foreach (var item in bow)
			{
				if (maks == 0)
				{
					tfv[item.Key] = 0.0;
				}
				else
				{
					tfv[item.Key] = (double)bow[item.Key] / maks;
				}
			}
			return tfv;
		}

		/// <summary>
		/// Zwraca liczbę wystąpień terma w tym dokumencie
		/// </summary>
		private int IleWZapytaniu(Term term)
		{
			// można by zoptymalizować korzystając z tego że termy są posortowane ale mi się nie chce ;)
			int ile = 0;
			foreach (Term t in this.Termy)
			{
				if (term.TermStemming == t.TermStemming)
				{
					ile++;
				}
			}
			return ile;
		}
	}
}
