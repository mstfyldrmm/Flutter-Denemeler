import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/flappy_birds/bird.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double birdY = 0;

  void jump() {
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        birdY -= 0.05;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: jump,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  child: Center(
                    child: Stack(children: [MyBird()]),
                  ),
                  color: Colors.blue,
                )),
            Expanded(
                child: Container(
              color: Colors.brown,
            ))
          ],
        ),
      ),
    );
  }
}
