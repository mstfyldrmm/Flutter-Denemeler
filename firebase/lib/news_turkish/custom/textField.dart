import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.icon,
    this.sifreGizle = false,
    this.radius = const BorderRadius.all(Radius.circular(0)),
    required this.controller,
  });
  final String title;
  final Icon icon;
  final BorderRadius radius;
  final TextEditingController controller;
  final bool sifreGizle;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: sifreGizle,
      
      decoration: InputDecoration(
          prefixIcon: icon,
          hintText: title,
          hintStyle: Theme.of(context).textTheme.bodyMedium,
          disabledBorder: OutlineInputBorder(
              borderRadius: radius,
              borderSide: BorderSide(color: Color.fromARGB(255, 42, 42, 42))),
          enabledBorder: OutlineInputBorder(
              borderRadius: radius,
              borderSide:
                  BorderSide(color: const Color.fromARGB(255, 42, 42, 42))),
          focusedBorder: OutlineInputBorder(
              borderRadius: radius,
              borderSide: BorderSide(color: Color.fromARGB(255, 42, 42, 42)))),
    );
  }
}