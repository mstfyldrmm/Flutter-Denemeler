// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase/news_turkish/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: ProjectColor.textSeconColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        action: SnackBarAction(
          label: 'Tamam',
          onPressed: () {
            // İsteğe bağlı: 'Tamam' butonuna basıldığında yapılacaklar
          },
          textColor: ProjectColor.textColor,
        ),
      ),
    );
  }
}
