   M S B A M L   `   `   `  ����O  KGismeteoPresentation, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:GismeteoPresentationGismeteoPresentation  5   	   '    !GismeteoPresentation.GismeteoView   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   4local"clr-namespace:GismeteoPresentation     5   	     � Title$  GismeteoView��5	   	   $	��450��6   $	��800��6+   .��5
      �  � ColumnDefinitions 5   
   �� 5      �� 5      $	��200 �6    � RowDefinitions 5   
   �� 5      $��30 �6   �� 5      $
��auto �6   �� 5      .+�5   
   �� $��4q�5       �� DisplayMemberPath$
 Name��5      ��5      �� *Cities+ �� SelectedItem 5      �� *CurrentCity+ �� UpdateSourceTrigger$ PropertyChanged=�5      �� 5   
   $��4q�5      $��1��5      $%��Запросить погоду��5      ��5      �� *FindForecast+�� 5!   
   $��4q�5"      $��1��5#      $��2��5$      $��Center=�5%      ��5&      �� *Information+&   System.Windows.Controls.DataGrid  5(   
   $��2��5)      $��2��5*         AutoGenerateColumns .     
IsReadOnly . ��5+      �� *ForecastList+   Columns 5.      0  *System.Windows.Controls.DataGridTextColumn  5/      ,  &System.Windows.Controls.DataGridColumn	   Header$	 
Время��50      
   Width5  /System.Windows.Controls.DataGridLengthConverter$	
 100 51      1  +System.Windows.Controls.DataGridBoundColumn   Binding 52      �� *Time+  53      $	 Температура��54      $	
 100 55       56      �� *Temperature+  57      $	 Давление��58      $	
 100 59       5:      �� *
Pressure+  5;      $	 
Ветер��5<      $	
 100 5=       5>      �� *Wind+5@      5A      5B      