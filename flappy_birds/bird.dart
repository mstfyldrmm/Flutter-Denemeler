import 'package:flutter/material.dart';

class MyBird extends StatelessWidget {
  MyBird({Key? key, this.birdY}) : super(key: key);

  final birdY;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, birdY),
      width: 50,
      height: 50,
      child: Image.asset('assets/icon/bird.png'),
    );
  }
}
