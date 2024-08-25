import 'package:flutter/material.dart';

class CalculatorTheme {
  ThemeData theme = ThemeData(
    scaffoldBackgroundColor: CalculatorColors().scaffolColor,
  );
}

class CalculatorColors {
  final scaffolColor = Colors.deepPurple[100];
  final spaceColor = Colors.deepPurple;
  final buttonTextColorOne = Colors.white;
  final buttonTextColorTwo = Colors.deepPurple;
  final buttonColorsOne = Colors.deepPurple;
  final buttonColorsTwo = Colors.deepPurple[50];
  final clearButtonColor = Colors.yellow;
  final delColors = Colors.red;
}
