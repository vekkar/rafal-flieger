using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using PorterStemmerAlgorithm;
using System.Text.RegularExpressions;
using System.Collections;

namespace Wyszukiwarka
{
	public class DokumentSource
	{
		/// <summary>
		/// Wczytane dokumenty - mogą być nieposortowane. Aby posortować należy wywołać SortDokumentList()
		/// </summary>
		public List<Dokument> Dokumenty = null;

		/// <summary>
		/// Wczytane termy
		/// </summary>
		public List<Term> Termy = new List<Term>();

		public bool WczytajDokumenty(string path)
		{
			if (path.Length > 0 && File.Exists(path))
			{
				try
				{
					string documents = string.Empty;
					using (TextReader tr = new StreamReader(File.Open(path, FileMode.Open)))
					{
						documents = tr.ReadToEnd();
					}
					string[] tmpDocs = documents.Split(new string[] { "\r\n\r\n" }, StringSplitOptions.RemoveEmptyEntries);
					if (tmpDocs != null && tmpDocs.Length > 0)
					{
						this.Dokumenty = new List<Dokument>();
						PorterStemmer ps = new PorterStemmer();
						foreach (string item in tmpDocs)
						{
							int index = item.IndexOf('\n');
							if (index > 0 && index < item.Length)
							{
								Dokument newDoc = new Dokument
								{
									NaglowekOryginal = item.Substring(0, index),
									TrescOryginal = item.Substring(index + 1, item.Length - index - 1)
								};

								// usuwamy interpunkcję
								string naglStem = Regex.Replace(newDoc.NaglowekOryginal, "(\\p{P})", string.Empty).ToLower();
								string trescStem = Regex.Replace(newDoc.TrescOryginal, "(\\p{P})", string.Empty).ToLower().Replace('\n', ' ');

								///teraz nagłówek jest klasą i nie jest używany
                                // używamy algorytmu Portera dla nagłówka
                                //string[] splitted = naglStem.Split(new string[] { " " }, StringSplitOptions.RemoveEmptyEntries);
                                //naglStem = string.Empty;
                                //foreach (string s in splitted)
                                //{
                                //    string st = ps.stemTerm(s.Trim());
                                //    naglStem += st + " ";
                                //    newDoc.Termy.Add(new Term
                                //    {
                                //        TermStemming = st
                                //    });
                                //}
                                //naglStem = naglStem.Substring(0, naglStem.Length - 1);

								// używamy algorytmu Portera dla treści
								string[] splitted = trescStem.Split(new string[] { " " }, StringSplitOptions.RemoveEmptyEntries);
								trescStem = string.Empty;
								foreach (string s in splitted)
								{
									string st = ps.stemTerm(s.Trim());
									trescStem += st + " ";
									newDoc.Termy.Add(new Term
									{
										TermStemming = st
									});
								}
								trescStem = trescStem.Substring(0, trescStem.Length - 1);

								newDoc.NaglowekStemming = naglStem;
								newDoc.TrescStemming = trescStem;
								this.Dokumenty.Add(newDoc);
							}
						}
						return true;
					}
				}
				catch (Exception ex)
				{
					return false;
				}
			}
			return false;
		}

		public bool WczytajTermy(string path)
		{
			if (path.Length > 0 && File.Exists(path))
			{
				try
				{
					string terms = string.Empty;
					using (TextReader tr = new StreamReader(File.Open(path, FileMode.Open)))
					{
						terms = tr.ReadToEnd();
					}
					string[] tmpTerms = terms.Split(new string[] { "\n" }, StringSplitOptions.RemoveEmptyEntries);
					if (tmpTerms != null && tmpTerms.Length > 0)
					{
						this.Termy = new List<Term>();
						PorterStemmer ps = new PorterStemmer();
						foreach (string item in tmpTerms)
						{
							Term newTerm = new Term
							{
								TermOryginal = item
							};

							// usuwamy interpunkcję
							string termStem = Regex.Replace(newTerm.TermOryginal, "(\\p{P})", string.Empty).ToLower().Trim();
							// używamy algorytmu Portera
							newTerm.TermStemming = ps.stemTerm(termStem);
							this.Termy.Add(newTerm);
						}
						this.Termy.Sort((x, y) => x.TermOryginal.CompareTo(y.TermOryginal));
						this.Termy = this.Termy.Distinct(Term.EqComparer).ToList();
						return true;
					}
				}
				catch
				{
					return false;
				}
			}
			return false;
		}

		/// <summary>
		/// Sortuje listę dokumentów
		/// </summary>
		/// <returns>Posortowana lista</returns>
		public List<Dokument> SortDokumentList()
		{
			try
			{
				this.Dokumenty.Sort(new Comparison<Dokument>((x, y) => y.MiaraPrawdopodobienstwa.CompareTo(x.MiaraPrawdopodobienstwa)));
			}
			catch
			{
			}
			return this.Dokumenty;
		}
	}
}
