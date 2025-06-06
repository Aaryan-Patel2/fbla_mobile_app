import 'package:flutter/material.dart';
import 'package:fbla_mobile_app/widgets/buttons.dart';
import 'package:fbla_mobile_app/core/routes/app_routes.dart';
import 'globals.dart';

class MathLevelsScreen extends StatelessWidget {
  const MathLevelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                Text("Choose a Math Level",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                _buildLevelButton(context, "Algebra", Colors.blue, 0, gameMode),
                _buildLevelButton(
                    context, "Trigonometry", Colors.purple, 1, gameMode),
                _buildLevelButton(context, "Calculus", Colors.red, 2, gameMode),
              ],
            ),
          ),
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

  Widget _buildLevelButton(BuildContext context, String levelName, Color color,
      int levelIndex, String gameMode) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          level = levelIndex; // Set global int value for level

          if (game == 1) {
            Navigator.pushNamed(
              context,
              AppRoutes.timeTrialScreen,
              arguments: {'level': levelName, 'gameMode': gameMode},
            );
          } else if (game == 2) {
            Navigator.pushNamed(
              context,
              AppRoutes.battleshipScreen,
              arguments: {'level': levelName, 'gameMode': gameMode},
            );
          } else if (game == 3) {
            Navigator.pushNamed(
              context,
              AppRoutes.geoguesserScreen,
              arguments: {'level': levelName, 'gameMode': gameMode},
            );
          } else if (game == 4) {
            Navigator.pushNamed(
              context,
              AppRoutes.asteroidScreen,
              arguments: {'level': levelName, 'gameMode': gameMode},
            );
          } else {
            Navigator.pushNamed(
              context,
              AppRoutes.quizScreen,
              arguments: {'level': levelName, 'gameMode': gameMode},
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
            levelName,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}