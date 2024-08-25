import 'package:flutter/material.dart';

class FoodAppTheme {
  ThemeData theme = ThemeData(
    scaffoldBackgroundColor: ProjectColor().backroundColor,
    iconTheme: IconThemeData(color: ProjectColor().iconColor),
    textTheme: TextTheme(
      bodyMedium:
          TextStyle(color: ProjectColor().titleColor, fontFamily: 'Montserrar'),
    ),
  );
}

class ProjectColor {
  final Color backroundColor = Color(0xFF21BFBD);
  final Color titleColor = Colors.white;
  final Color iconColor = Colors.white;
  final Color containerColor = Colors.white;
}
