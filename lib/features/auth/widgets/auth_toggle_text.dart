import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class AuthToggleText extends StatelessWidget {
  final String prefixText;
  final String actionText;
  final VoidCallback onTap;

  const AuthToggleText({
    super.key,
    required this.prefixText,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          prefixText,
          style: const TextStyle(color: Colors.white70),
        ),
        InkWell(
          onTap: onTap,
          child: GradientText(
            actionText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            colors: const [
              Color.fromRGBO(127, 219, 255, 1),
              Color.fromRGBO(66, 126, 235, 1),
              Color.fromRGBO(78, 74, 242, 1),
            ],
          ),
        ),
      ],
    );
  }
}