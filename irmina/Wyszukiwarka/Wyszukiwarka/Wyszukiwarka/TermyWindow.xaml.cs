﻿using System;
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
	public partial class TermyWindow : Window
	{
		public TermyWindow(List<Term> termy)
		{
			InitializeComponent();
			gridTerms.ItemsSource = termy;
		}

		private void button1_Click(object sender, RoutedEventArgs e)
		{
			this.Close();
		}
	}
}

