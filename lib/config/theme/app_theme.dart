import 'package:flutter/material.dart';

final colorList = <Color>[
    Colors.blue,
    Colors.teal,
    Colors.green, 
    Colors.red,
    Colors.purple,
    Colors.deepPurple,
    Colors.orange,
    Colors.pink,
    Colors.pinkAccent
  ];

class AppTheme {

  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, required this.isDarkMode})
    : assert(selectedColor >= 0, 'Selected color must be greater than 0'),
      assert(selectedColor < colorList.length, 'Selected color must be between 0 to ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false
    )
  );

  
}