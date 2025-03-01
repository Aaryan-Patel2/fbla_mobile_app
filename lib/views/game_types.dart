import 'package:flutter/material.dart';
import 'package:fbla_mobile_app/widgets/buttons.dart';
import 'package:fbla_mobile_app/routes/app_routes.dart';
import '../globals.dart';

class GameSelections extends StatefulWidget {
  const GameSelections({super.key});

  @override
  _GameSelectionsState createState() => _GameSelectionsState();
}

class _GameSelectionsState extends State<GameSelections> {
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
            // Positioned areas for each game mode option
            Positioned(
              top: screenHeight * 0.2,
              left: screenWidth * 0.05,
              width: screenWidth * 0.4,
              height: screenHeight * 0.2,
              child: GestureDetector(
                onTap: () {
                  // First action: Set the global variable 'game' to 0
                  game = 1;

                  // Second action: Navigate to the subjectSelectionScreen
                  Navigator.pushNamed(
                      context, AppRoutes.subjectSelectionScreen);
                },
                child: Container(color: Colors.transparent),
              ),
            ),
            Positioned(
              top: screenHeight * 0.15,
              left: screenWidth * 0.55,
              width: screenWidth * 0.4,
              height: screenHeight * 0.2,
              child: GestureDetector(
                onTap: () {
                  // First action: Set the global variable 'game' to 0
                  game = 0;

                  // Second action: Navigate to the subjectSelectionScreen
                  Navigator.pushNamed(
                      context, AppRoutes.subjectSelectionScreen);
                },
                child: Container(color: Colors.transparent),
              ),
            ),
            Positioned(
              top: screenHeight * 0.5,
              left: screenWidth * 0.05,
              width: screenWidth * 0.4,
              height: screenHeight * 0.2,
              child: GestureDetector(
                onTap: () {
                  // First action: Set the global variable 'game' to 0
                  game = 2;

                  // Second action: Navigate to the subjectSelectionScreen
                  Navigator.pushNamed(
                      context, AppRoutes.subjectSelectionScreen);
                },
                child: Container(color: Colors.transparent),
              ),
            ),
            // Return to Home Button
            Positioned(
              bottom: screenHeight * 0.05,
              left: screenWidth * 0.05,
              child: ReturnToHomeButton(
                onPressed: () => Navigator.pushReplacementNamed(
                    context, AppRoutes.homeScreen),
              ),
            ),
          ],
        ),
      ),
    );
  }
}