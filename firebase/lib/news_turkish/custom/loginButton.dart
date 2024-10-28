import 'package:firebase/news_turkish/theme/color.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  LoginButton({super.key, this.func, required this.title});
  void Function()? func;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          onPressed: func,
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10), // Butonun köşelerini yuvarlama
              ),
              padding: EdgeInsets.only(right: 10, left: 10, bottom: 15, top: 15),
              backgroundColor: ProjectColor.buttonTwoColor)),
    );
  }
}
