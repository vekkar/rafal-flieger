   M S B A M L   `   `   `  ����   Wyszukiwarka     Wyszukiwarka.ProgramWindow   \ XPresentationFramework, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     8x,http://schemas.microsoft.com/winfx/2006/xaml    6dg-http://schemas.microsoft.com/wpf/2008/toolkit    � Title$  Wyszukiwarka��$	��800��$	��700��$	��300��$	��400�� � 	Resources  �� MergedDictionaries �� Source��  �� $ styles.xaml?�%    .���  � RowDefinitions �� $��22 ��� $
��auto ��� $��10 ��� $��2 ��� $��* ��� $��22 �.+�o� -   $��mainMenu��$��0��$
��Auto��.@�m� $
��Plik��.@�m� -   $ ��Wczytaj plik z dokumentami��m� -   $��Wczytaj plik z termami��m� -   $��Zamknij��m� $��Widok��.@�m� -   $��
miWidokTer��{�.  $��Pokaż termy po stemmingu��� $��1��$��70����L�  L� Drawing �  � Brush 
� .���  � Color$ White�� � Offset$	 0.0Q�� $ 
WhiteSmoke��$	 1.0Q�	 � Geometry	 � .���� 
 �� Rect$
 	0,0,50,50� �� $��3* ��� $��2* �.+�]� $��0��$
��Auto��$
��Auto����. .+��� -   $��label1��$��27.775��$��50��.��
Znajdź:�� -   $��tbZapytanie��$��23.331��$��10q�$��2q�.��anaconda animal� $��1�� �� $
��Auto � � ColumnDefinitions �� �� �� �� .+��� -   $��btSzukaj��$��0��$��23.331��$	��100��{�.  .��Szukaj9�  9� ExpandDirection$ Right=�$��1��$��3��.����  �� Orientation$ 
Horizontal=�.+��� -	   $��	btSzukaj2��$��20��$��10 0 5 0q�$	��100��{�.  .��
Szukaj 500�� $"��liczba dodatkowych termów :��$��2q��� -
   $��number_of_terms_Tblock��$��21��$��30��$��3 2 0 2q�.��2�� $��waga termów :��$��2q��� -   $��termCoefficent_Tblock��$��21��$��50��$��3 2 0 2q�.��0,50�� $��2��
��������� $��3��
��������� $��4��$��1q�.���� 
�������    dokumentyLayout �� DataType �� Path��%  &	        �� $ Dokument��.R��� $ Vertical=�.+��� $
��Bold"�$��13(�
����  ����� $ NaglowekOryginal��� $ 
Horizontal=�.+��� $��10(�$��0,2,0,0q�$"��Miara prawdopodobieństwa:  ���� $
��Bold"����� $ MiaraPrawdopodobienstwa�.+��� -    ��Name$ lbWyniki��  ListBoxStyle#��[ #���   $ �� IsSynchronizedWithCurrentItem$
 TrueY��� $��5��$��22��$��Stretch=�.+�� -   $��progressBar��$��20��