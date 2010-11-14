using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using PorterStemmerAlgorithm;
using System.Windows.Controls;
using System.Windows.Threading;
using System.Threading;

namespace Wyszukiwarka
{
	public class Megawyszukiwacz
	{
		private List<Dokument> dokumenty = new List<Dokument>();
		private List<Term> termy = new List<Term>();

		public Megawyszukiwacz(ref List<Dokument> dokumenty, List<Term> termy)
		{
			this.dokumenty = dokumenty;
			this.termy = termy.Distinct(Term.EqComparer).ToList();
		}

		/// <summary>
		/// Robi wszystko co potrzeba żeby przyporządkować miary prawdopodobieństwa do dokumentów
		/// </summary>
		/// <param name="zapytanie">Zapytanie usera</param>
		public void DajCzadu(string zapytanie, ProgressBar progBar)
		{
			progBar.Value = 0;
			Term[] termyZapytania = PrzerobNaTermy(zapytanie);

			// zapytanie traktujemy jak dokument
			Dokument zapDok = new Dokument
			{
				Termy = termyZapytania.ToList()
			};
			zapDok.WypelnijWektory(this.termy, this.LiczIDF());

			for (int i = 0; i < this.dokumenty.Count && this.dokumenty.Count > 0; i++)
			{
				progBar.Dispatcher.Invoke(DispatcherPriority.Render, new ThreadStart(delegate
				{
					progBar.Value = ((i + 1) * 100) / this.dokumenty.Count;
					progBar.InvalidateVisual();
					progBar.UpdateLayout();
				}));
				this.dokumenty[i].WypelnijWektory(this.termy, zapDok, this.LiczIDF());
			}
			progBar.Value = 0;
		}

		private Dictionary<string, double> LiczIDF()
		{
			Dictionary<string, double> idfv = new Dictionary<string, double>();
			foreach (var item in this.termy)
			{
				int ile = this.IleDokumentowZawiera(item);
				idfv[item.TermStemming] = ile == 0 ? 0 : Math.Log10(this.dokumenty.Count / ile);
			}
			return idfv;
		}

		private int IleDokumentowZawiera(Term term)
		{
			int i = 0;
			foreach (Dokument d in this.dokumenty)
			{
				if (d.Termy.Contains(term, Term.EqComparer))
				{
					i++;
				}
			}
			return i;
		}

		private static Term[] PrzerobNaTermy(string zapytanie)
		{
			zapytanie = Regex.Replace(zapytanie, "(\\p{P})", string.Empty).ToLower();
			string[] zap = zapytanie.Split(new string[] { " " }, StringSplitOptions.RemoveEmptyEntries);
			List<Term> retTerm = new List<Term>();
			PorterStemmer ps = new PorterStemmer();
			foreach (string s in zap)
			{
				retTerm.Add(new Term
				{
					TermOryginal = s,
					TermStemming = ps.stemTerm(s)
				});
			}

			// sortujemy wg termow juz PODDANYCH STEMMINGOWI
			retTerm.Sort((x, y) => x.TermStemming.CompareTo(y.TermStemming));
			// usuwamy duplikaty
			retTerm = retTerm.Distinct(Term.EqComparer).ToList();
			return retTerm.ToArray();
		}
	}
}
