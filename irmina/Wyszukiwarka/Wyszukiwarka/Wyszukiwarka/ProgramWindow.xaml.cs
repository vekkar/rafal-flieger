using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using PorterStemmerAlgorithm;
using Microsoft.Win32;
using System.IO;

namespace Wyszukiwarka
{
	/// <summary>
	/// Interaction logic for Window1.xaml
	/// </summary>
	public partial class ProgramWindow : Window
	{
		private DokumentSource dokSource = null;

		public ProgramWindow()
		{
			InitializeComponent();
			this.progressBar.Minimum = 0;
			this.progressBar.Maximum = 100;
			this.dokSource = new DokumentSource();
		}

		private void ZamknijMenuItem_Click(object sender, RoutedEventArgs e)
		{
			this.Close(); // :)
		}

		private void WczytajDokumentyMenuItem_Click(object sender, RoutedEventArgs e)
		{
			OpenFileDialog ofd = new OpenFileDialog();
			ofd.Multiselect = false;
			ofd.Filter = "Pliki tekstowe dokumentów|*.txt";
			ofd.ShowDialog();
			if (dokSource.WczytajDokumenty(ofd.FileName))
			{
				this.lbWyniki.ItemsSource = this.dokSource.SortDokumentList();
				if (this.dokSource.Dokumenty.Count > 0)
				{
					if (this.dokSource.Termy != null && this.dokSource.Termy.Count > 0)
					{
						this.btSzukaj.IsEnabled = true;
					}
					else
					{
						this.btSzukaj.IsEnabled = false;
					}
				}
				else
				{
					this.btSzukaj.IsEnabled = false;
				}
			}
		}

		private void WczytajTermyMenuItem_Click(object sender, RoutedEventArgs e)
		{
			OpenFileDialog ofd = new OpenFileDialog();
			ofd.Multiselect = false;
			ofd.Filter = "Pliki tekstowe termów|*.txt";
			ofd.ShowDialog();
			if (dokSource.WczytajTermy(ofd.FileName))
			{
				if (this.dokSource.Termy.Count > 0)
				{
					this.miWidokTer.IsEnabled = true;
					if (this.dokSource.Dokumenty != null && this.dokSource.Dokumenty.Count > 0)
					{
						this.btSzukaj.IsEnabled = true;
					}
					else
					{
						this.btSzukaj.IsEnabled = false;
					}
				}
				else
				{
					this.miWidokTer.IsEnabled = false;
					this.btSzukaj.IsEnabled = false;
				}
			}
		}

		private void PokazTermyPoStemminguMenuItem_Click(object sender, RoutedEventArgs e)
		{
			TermyWindow tw = new TermyWindow(this.dokSource.Termy);
			tw.ShowDialog();
		}

		private void StackPanel_MouseDoubleClick(object sender, MouseButtonEventArgs e)
		{
			// MessageBox.Show((lbWyniki.Items.CurrentItem as Dokument).TrescOryginal);
			DokumentWindow dw = new DokumentWindow(lbWyniki.Items.CurrentItem as Dokument);
			dw.ShowDialog();
		}

		private void btSzukaj_Click(object sender, RoutedEventArgs e)
		{
			Megawyszukiwacz mw = new Megawyszukiwacz(ref this.dokSource.Dokumenty, this.dokSource.Termy);
			mw.DajCzadu(this.tbZapytanie.Text, this.progressBar);
			this.lbWyniki.ItemsSource = this.dokSource.SortDokumentList();
			this.lbWyniki.Items.Refresh();
		}

		private void tbZapytanie_KeyUp(object sender, KeyEventArgs e)
		{
			if (e.Key == Key.Enter && this.btSzukaj.IsEnabled)
			{
				this.btSzukaj_Click(sender, e);
			}
		}

        private void btSzukaj2_Click(object sender, RoutedEventArgs e)
        {
            Megawyszukiwacz mw = new Megawyszukiwacz(ref this.dokSource.Dokumenty, this.dokSource.Termy);
            try
            {
                mw.DajCzadu500(this.tbZapytanie.Text, this.progressBar,2,double.Parse(termCoefficent_Tblock.Text) );
                this.lbWyniki.ItemsSource = this.dokSource.SortDokumentList();
                this.lbWyniki.Items.Refresh();}
                catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
	}
}

