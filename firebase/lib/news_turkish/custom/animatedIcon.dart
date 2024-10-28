import 'package:animated_icon/animated_icon.dart';
import 'package:flutter/material.dart';

class AnimatedIconWidget extends StatelessWidget {
  const AnimatedIconWidget({
    super.key, required this.icon, required this.color,
  });
  final AnimateIcons icon;
  final Color color;


  @override
  Widget build(BuildContext context) {
    return AnimateIcon(
                key: UniqueKey(),
                onTap: () {},
                iconType: IconType.continueAnimation,
                height: 30,
                width: 30,
                color: color,
                animateIcon: icon
            );
  }
}