import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase/news_turkish/screen/login_screen.dart';
import 'package:firebase/news_turkish/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashsScreen extends StatelessWidget {
  const SplashsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: MediaQuery.of(context).size.height / 2,
      duration: 5000,
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            PageStrings.lottiePath,
            fit: BoxFit.contain,
            height: 150,
          ),
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                curve: Curves.bounceInOut,
                PageStrings.title,
                textStyle: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 25),
                speed: const Duration(milliseconds: 500),
              ),
            ],
            totalRepeatCount: 1,
            pause: const Duration(milliseconds: 500),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          )
        ],
      ),
      nextScreen: LoginPage(),
      backgroundColor: ProjectColor.backgroundColor
    );
  }
}

class PageStrings {
  static String lottiePath = 'assets/Lottie/logoo.json';
  static String title = 'Gündemdeyiz';
}