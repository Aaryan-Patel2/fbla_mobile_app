import 'package:flutter/material.dart';
import 'package:fbla_mobile_app/widgets/buttons.dart'; // Import the custom button

class MathLevelsScreen extends StatelessWidget {
  const MathLevelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Choose a Math Level",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                _buildLevelButton(
                    context, "Algebra", Colors.blue, '/algebra_quiz'),
                _buildLevelButton(
                    context, "Trigonometry", Colors.purple, '/trig_quiz'),
                _buildLevelButton(
                    context, "Calculus", Colors.red, '/calc_quiz'),
              ],
            ),
          ),

          // Return to Home Button (Bottom Left Corner)
          Positioned(
            bottom: 20,
            left: 20,
            child: ReturnToHomeButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLevelButton(
      BuildContext context, String level, Color color, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () => Navigator.pushReplacementNamed(context, route),
        child: Container(
          width: 250,
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(colors: [color, Colors.black]),
          ),
          child: Text(
            level,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}