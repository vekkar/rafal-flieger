using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;

namespace Wyszukiwarka
{
	public class Term
	{
		private class TermEqComparer : IEqualityComparer<Term>
		{
			public bool Equals(Term x, Term y)
			{
				if (x.TermStemming == y.TermStemming)
				{
					return true;
				}
				else
				{
					return false;
				}
			}

			public int GetHashCode(Term obj)
			{
				int a = obj.TermStemming != null ? obj.TermStemming.Length : 1;
				int b = obj.TermOryginal != null ? obj.TermOryginal.Length : 2;
				return (a + b).GetHashCode();
			}
		}

		public string TermOryginal { get; set; }
		public string TermStemming { get; set; }
		public static IEqualityComparer<Term> EqComparer = new TermEqComparer();
	}
}
