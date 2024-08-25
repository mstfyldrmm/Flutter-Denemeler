import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/food_app/theme/theme.dart';

class AnaEkran extends StatefulWidget {
  const AnaEkran({Key? key}) : super(key: key);

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios_new),
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(30),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: [
                Text(
                  ProjectString().title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  ProjectString().titlee,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            color: ProjectColor().containerColor,
            height: MediaQuery.of(context).size.height - 185.0,
          )
        ],
      ),
    );
  }
}

class ProjectString {
  final String title = 'Healty';
  final String titlee = 'Food';
}
