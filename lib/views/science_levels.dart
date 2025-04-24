import 'package:flutter/material.dart';
import 'package:fbla_mobile_app/widgets/buttons.dart';
import 'package:fbla_mobile_app/core/routes/app_routes.dart';
import 'globals.dart';

class ScienceLevelsScreen extends StatelessWidget {
  const ScienceLevelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String gameMode =
        ModalRoute.of(context)?.settings.arguments as String? ?? "practice";

    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Choose a Science Level",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                _buildLevelButton(
                    context, "Biology", Colors.green, 0, gameMode),
                _buildLevelButton(
                    context, "Chemistry", Colors.orange, 1, gameMode),
                _buildLevelButton(context, "Physics", Colors.teal, 2, gameMode),
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
          scienceLevel = levelIndex; // Set global level index

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
