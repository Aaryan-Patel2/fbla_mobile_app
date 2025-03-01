import 'package:flutter/material.dart';
import 'package:fbla_mobile_app/widgets/buttons.dart';
import 'package:fbla_mobile_app/routes/app_routes.dart';

class GameSelections extends StatefulWidget {
  const GameSelections({super.key});

  @override
  _GameSelectionsState createState() => _GameSelectionsState();
}

class _GameSelectionsState extends State<GameSelections> {
  // Method to navigate to the game mode screen based on the selected game type
  void _navigateToGame(BuildContext context, String gameMode) {
    String route;

    // Set the route based on the selected game mode
    switch (gameMode) {
      case "battleship":
        route = AppRoutes.battleshipScreen;
        break;
      case "time-trial":
        route = AppRoutes.timeTrialScreen;
        break;
      case "quiz":
        route = AppRoutes.quizScreen;
        break;
      default:
        route = AppRoutes.homeScreen; // Default to home if no game mode matches
        break;
    }

    // Navigate to the selected game mode screen
    Navigator.pushReplacementNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              width: screenWidth,
              height: screenHeight,
              child: Image.asset(
                'lib/assets/game_options.png',
                fit: BoxFit.cover,
              ),
            ),
            // Positioned areas for each game mode option (Battleship, Time Trial, Quiz)
            Positioned(
              top: screenHeight * 0.2,
              left: screenWidth * 0.05,
              width: screenWidth * 0.4,
              height: screenHeight * 0.2,
              child: GestureDetector(
                onTap: () => _navigateToGame(context, "time-trial"),
                child: Container(color: Colors.transparent),
              ),
            ),
            Positioned(
              top: screenHeight * 0.15,
              left: screenWidth * 0.55,
              width: screenWidth * 0.4,
              height: screenHeight * 0.2,
              child: GestureDetector(
                onTap: () => _navigateToGame(context, "quiz"),
                child: Container(color: Colors.transparent),
              ),
            ),
            Positioned(
              top: screenHeight * 0.5,
              left: screenWidth * 0.05,
              width: screenWidth * 0.4,
              height: screenHeight * 0.2,
              child: GestureDetector(
                onTap: () => _navigateToGame(context, "battleship"),
                child: Container(color: Colors.transparent),
              ),
            ),
            // Return to Home Button
            Positioned(
              bottom: screenHeight * 0.05,
              left: screenWidth * 0.05,
              child: ReturnToHomeButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, AppRoutes.homeScreen),
              ),
            ),
          ],
        ),
      ),
    );
  }
}