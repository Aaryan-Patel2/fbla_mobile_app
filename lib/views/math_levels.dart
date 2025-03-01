import 'package:flutter/material.dart';
import 'package:fbla_mobile_app/widgets/buttons.dart';
import 'package:fbla_mobile_app/routes/app_routes.dart';

class MathLevelsScreen extends StatelessWidget {
  const MathLevelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the gameMode argument passed from the previous screen
    final String gameMode = ModalRoute.of(context)?.settings.arguments as String? ?? "practice";

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
                    context, "Algebra", Colors.blue, gameMode, '/algebra_quiz'),
                _buildLevelButton(
                    context, "Trigonometry", Colors.purple, gameMode, '/trig_quiz'),
                _buildLevelButton(
                    context, "Calculus", Colors.red, gameMode, '/calc_quiz'),
              ],
            ),
          ),
          // Return to Home Button (Bottom Left Corner)
          Positioned(
            bottom: 20,
            left: 20,
            child: ReturnToHomeButton(
              onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.homeScreen),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLevelButton(
      BuildContext context, String level, Color color, String gameMode, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          // Based on the selected level, navigate to the corresponding game mode
          // We pass gameMode so that the next screen knows which game was selected
          String gameRoute = route;
          Navigator.pushReplacementNamed(
            context,
            gameRoute, // Navigate to the game route (for example, /algebra_quiz)
            arguments: gameMode, // Pass the gameMode to the quiz screen
          );
        },
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