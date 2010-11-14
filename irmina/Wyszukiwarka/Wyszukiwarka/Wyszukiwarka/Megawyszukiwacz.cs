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
        private void DoStaff(Term[] termyZapytania, ProgressBar progBar)
        {

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

		
		public void DajCzadu(string zapytanie, ProgressBar progBar)
		{
			progBar.Value = 0;
			Term[] termyZapytania = PrzerobNaTermy(zapytanie);

            this.DoStaff(termyZapytania, progBar);
			
		}

        public void DajCzadu500(string zapytanie, ProgressBar progBar, int numbeOfAddTerms, double termCoefficent)
        {
            progBar.Value = 0;
            Term[] previousZapytanie = PrzerobNaTermy(zapytanie);
            List<Term> newZaptanie = previousZapytanie.ToList<Term>();
            Dictionary<Term , List<CorelatedTerm>> corTerms= this.BuildMeMatrix();

            foreach (Term questione in previousZapytanie)
            {
                Term additionalTerm;
                //Term extra = corTerms[questione].First(); // ale urwał!!! ale nie sprawdziłem czy tak moze być a teraz już tak zostanie na zawsze:)!!!
                List<CorelatedTerm> corelated=null;
                var xxx = corTerms.FirstOrDefault(x => x.Key.TermStemming == questione.TermStemming); // ale urwal 500!!!
                if (xxx.Value == null)
                    continue;
                corelated = xxx.Value.ToList();  // ale urwał 5000!!!!
                do
                {
                    additionalTerm = corelated.First(); 
                    corelated.Remove(additionalTerm as CorelatedTerm);
                } while (additionalTerm != null && additionalTerm.TermStemming.Equals(questione.TermStemming));

                additionalTerm.TermCoefficent = termCoefficent; // wstaw wagę!!!
                newZaptanie.Add(additionalTerm);
                
                numbeOfAddTerms--;
                if (numbeOfAddTerms == 0) break;
            }

            this.DoStaff(newZaptanie.Distinct().ToArray(),progBar);
        }

        private class CorelatedTerm : Term
        {
            public double Value{get; set;}
            public CorelatedTerm(Term term)
            {
                this.TermOryginal = term.TermOryginal;
                this.TermStemming = term.TermStemming;
            }
        }

        private Dictionary<Term, List<CorelatedTerm>> BuildMeMatrix()
        {
            double[,] matrix = new double[this.termy.Count , this.dokumenty.Count];
            double[,] matrixT = new double[dokumenty.Count, termy.Count];
            double[,] matrixRet = new double[termy.Count, termy.Count];
            

            Dictionary<Term, List<CorelatedTerm>> corelMatrix = new Dictionary<Term, List<CorelatedTerm>>();

            //make sure that terms sorted;
            this.termy.Sort((x, y) => x.TermOryginal.CompareTo(y.TermOryginal));

            //create term-doc matrix 
            int i = 0, j = 0;
            foreach (Term term in termy)
            {
                foreach (Dokument doc in dokumenty)
                {
                    matrix[i, j] = doc.IleWZapytaniu(term);
                    j++;
                }
                i++;
                j = 0;
            }

            this.TransponeMatrix(matrix, matrixT);

            this.MultMatrix(matrix, matrixT, matrixRet);

            this.Normalize(matrixRet);

            for (int k = 0; k < termy.Count; k++)
            {
             corelMatrix.Add(termy[k],new List<CorelatedTerm>());
                for (int w = 0; w < termy.Count; w++)
                {
                    corelMatrix[termy[k]].Add(new CorelatedTerm(termy[w]){Value=matrixRet[k,w]});
                }
                corelMatrix[termy[k]].Sort((x, y) => y.Value.CompareTo(x.Value));
            }

            return corelMatrix;
        }

        private void Normalize(double[,] matrix)
        {
            double max = 0;

            for (int i=0; i < termy.Count; i++)
            {
                for (int j = 0; j < termy.Count; j++)
                {
                    if (matrix[i, j] > max)
                        max = matrix[i, j];
                }

                for (int j = 0; j< termy.Count; j++)
                {
                    matrix[i,j] = matrix[i,j] / max;
                }
                max = 0;
            }
        }

        private void MultMatrix(double[,] matrix1, double[,] matrix2, double[,] matrixRet)
        {
            int x = this.termy.Count;
            int y = this.dokumenty.Count;
            
            for (int i = 0; i < x; i++)
            {
                for (int j = 0; j < y - 1; j++)
                {
                    for (int k = 0; k < y; k++)
                    {

                        matrixRet[i,j] += matrix1[i,k] * matrix2[k,j];
                    }
                }
            } 
        }


        private void TransponeMatrix(double[,] matrix, double[,] matrixT)
        {
            for (int ii = 0; ii < termy.Count-1; ii++)
            {
                for (int jj = 0; jj < dokumenty.Count-1; jj++)
                    matrixT[jj, ii] = matrix[ii, jj];
            }
        }

		private Dictionary<string, double> LiczIDF()
		{
			Dictionary<string, double> idfv = new Dictionary<string, double>();
			foreach (var item in this.termy)
			{
				int ile = this.IleDokumentowZawiera(item);
                idfv[item.TermStemming] = ile == 0 ? 0 :
                    Math.Log10((double)this.dokumenty.Count / (double)ile);
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
