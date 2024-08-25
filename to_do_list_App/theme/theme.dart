import 'package:flutter/material.dart';

class ToDoProjectTheme {
  ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.yellow[200],
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Colors.yellow,
        
        ),
    appBarTheme: AppBarTheme(
        color: Colors.yellow,
        centerTitle: true,
        elevation: 0,
        textTheme: TextTheme(titleMedium: TextStyle(color: Colors.white))),
  );
}
