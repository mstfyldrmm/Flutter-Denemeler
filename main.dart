import 'package:flutter/material.dart';
import 'package:flutter_application_1/calculatorApp/theme/theme.dart';
import 'package:flutter_application_1/flappy_birds/home_page.dart';
import 'package:flutter_application_1/food_app/ana_ekran.dart';
import 'package:flutter_application_1/stopWatchApp/ana_ekran.dart';
import 'package:flutter_application_1/stopWatchApp/theme.dart';
import 'package:flutter_application_1/to_do_list_App/theme/theme.dart';
import 'package:flutter_application_1/to_do_list_app/ana_ekran.dart';
import 'food_app/ana_ekran.dart';
import 'food_app/theme/theme.dart';
import 'login_page/ana_ekran.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
