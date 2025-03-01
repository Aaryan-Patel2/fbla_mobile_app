// import 'package:fbla_mobile_app/views/game_types.dart';
import 'package:flutter/material.dart';
import 'package:fbla_mobile_app/widgets/buttons.dart';
import 'package:fbla_mobile_app/routes/app_routes.dart';
import '../globals.dart'; // Import the global variables

class MathLevelsScreen extends StatelessWidget {
  const MathLevelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the gameMode argument passed from the previous screen
    final String gameMode =
        ModalRoute.of(context)?.settings.arguments as String? ?? "practice";

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
                _buildLevelButton(context, "Trigonometry", Colors.purple,
                    gameMode, '/trig_quiz'),
                _buildLevelButton(context, "Calculus", Colors.red, gameMode,
                    'calculus_screen'),
              ],
            ),
          ),
          // Return to Home Button (Bottom Left Corner)
          Positioned(
            bottom: 20,
            left: 20,
            child: ReturnToHomeButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, AppRoutes.homeScreen),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLevelButton(BuildContext context, String level, Color color,
      String gameMode, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          if (route == 'calculus_screen') {
            // Navigate to a different screen based on the `game` variable
            if (game == 0) {
              Navigator.pushNamed(context, AppRoutes.quizScreen);
            } else if (game == 1) {
              Navigator.pushNamed(context, AppRoutes.timeTrialScreen);
            } else if (game == 2) {
              Navigator.pushNamed(context, AppRoutes.battleshipScreen);
            }
          } else {
            // Navigate to other quiz routes
            Navigator.pushReplacementNamed(
              context,
              route,
              arguments: gameMode,
            );
          }
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