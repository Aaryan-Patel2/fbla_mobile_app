import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:fbla_mobile_app/themes/app_theme.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GradientButton({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Dynamically adjust button width based on screen size
    double buttonWidth = screenWidth * 0.5; // 50% of screen width
    buttonWidth = buttonWidth.clamp(180.0, 300.0); // Set min/max width

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: buttonWidth,
          height: 50, // Keep height fixed for consistency
          decoration: BoxDecoration(
            gradient: AppTheme.secondaryGradient,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withAlpha(128),
                blurRadius: 5,
                offset: const Offset(2, 2),
              ),
            ],
            border: GradientBoxBorder(
              gradient: AppTheme.primaryGradient,
              width: 3,
            ),
          ),
          child: Center(
            child: GradientText(
              text,
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
              colors: [
                Color.fromRGBO(127, 219, 255, 1),
                Color.fromRGBO(66, 126, 235, 1),
                Color.fromRGBO(78, 74, 242, 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReturnToHomeButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ReturnToHomeButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 20,
      child: GestureDetector(
        onTap: onPressed,
        child: Image.asset(
          'assets/home_button.png',
          width: 50,  // Adjust size if needed
          height: 50, // Adjust size if needed
        ),
      ),
    );
  }
}