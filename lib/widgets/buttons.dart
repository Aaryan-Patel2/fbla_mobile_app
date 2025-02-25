import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart'; // Import GradientText
import 'package:gradient_borders/gradient_borders.dart'; // Import GradientBorders
import 'package:fbla_mobile_app/themes/app_theme.dart'; // Import your theme file

class GradientButton extends StatelessWidget {
  final String text;  // The text to display on the button

  GradientButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 225,
      height: 50,
      decoration: BoxDecoration(
        gradient: AppTheme.secondaryGradient, // Background uses secondaryGradient
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ],
        border: GradientBoxBorder(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(127, 219, 255, 1),  // Light Blue
              Color.fromRGBO(66, 126, 235, 1),   // Blue
              Color.fromRGBO(78, 74, 242, 1),    // Purple
            ],
          ),
          width: 3,  // Border width
        ),
      ),
      child: Center(
        child: GradientText(
          text,
          style: TextStyle(
            fontSize: 15.0, // Adjust font size as necessary
            fontWeight: FontWeight.bold,
          ),
          colors: [
            Color.fromRGBO(127, 219, 255, 1),  // Light Blue
            Color.fromRGBO(66, 126, 235, 1),   // Blue
            Color.fromRGBO(78, 74, 242, 1),    // Purple
          ],
        ),
      ),
    );
  }
}
