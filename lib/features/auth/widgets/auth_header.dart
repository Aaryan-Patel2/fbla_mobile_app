import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class AuthHeader extends StatelessWidget {
  final String title;

  const AuthHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GradientText(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      colors: const [
        Color.fromRGBO(127, 219, 255, 1),
        Color.fromRGBO(66, 126, 235, 1),
        Color.fromRGBO(78, 74, 242, 1),
      ],
    );
  }
}