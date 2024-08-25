import 'package:flutter/material.dart';

class LightTheme {
  ThemeData theme = ThemeData(
      scaffoldBackgroundColor: ProjectColor().backroundColor,
      backgroundColor: ProjectColor().backroundColor,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: ProjectColor().backroundColor,
          titleTextStyle: TextStyle(
              color: ProjectColor().titleColor,
              fontSize: 30,
              fontWeight: FontWeight.bold)));
}

class ProjectColor {
  final backroundColor = Color(0xFF1C2757);
  final titleColor = Colors.white;
  final textColor = Colors.white;
  final spaceColor = Color(0xFF323F68);
  final buttonColor = Colors.blue;
}
