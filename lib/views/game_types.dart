import 'package:flutter/material.dart';
import 'package:fbla_mobile_app/widgets/buttons.dart';
import 'package:fbla_mobile_app/core/routes/app_routes.dart';
import 'globals.dart';

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
            // Game = 1
            Positioned(
              top: screenHeight * 0.2,
              left: screenWidth * 0.05,
              width: screenWidth * 0.4,
              height: screenHeight * 0.2,
              child: GestureDetector(
                onTap: () {
                  game = 1;
                  Navigator.pushNamed(
                      context, AppRoutes.subjectSelectionScreen);
                },
                child: Container(color: Colors.black),
              ),
            ),
            // Game = 0
            Positioned(
              top: screenHeight * 0.15,
              left: screenWidth * 0.55,
              width: screenWidth * 0.4,
              height: screenHeight * 0.2,
              child: GestureDetector(
                onTap: () {
                  game = 0;
                  Navigator.pushNamed(
                      context, AppRoutes.subjectSelectionScreen);
                },
                child: Container(color: Colors.transparent),
              ),
            ),
            // Game = 2
            Positioned(
              top: screenHeight * 0.5,
              left: screenWidth * 0.05,
              width: screenWidth * 0.4,
              height: screenHeight * 0.2,
              child: GestureDetector(
                onTap: () {
                  game = 2;
                  Navigator.pushNamed(
                      context, AppRoutes.subjectSelectionScreen);
                },
                child: Container(color: Colors.transparent),
              ),
            ),
            // Game = 3 (New Red Box)
            Positioned(
              top: screenHeight * 0.5,
              left: screenWidth * 0.55,
              width: screenWidth * 0.4,
              height: screenHeight * 0.2,
              child: GestureDetector(
                onTap: () {
                  game = 3;
                  Navigator.pushNamed(context, AppRoutes.geographyLevelsScreen);
                },
                child: Container(color: Colors.red.withOpacity(0.5)),
              ),
            ),
            // Game = 4 (New Red Box)
            Positioned(
              top: screenHeight * 0.75,
              left: screenWidth * 0.3,
              width: screenWidth * 0.4,
              height: screenHeight * 0.15,
              child: GestureDetector(
                onTap: () {
                  game = 4;
                  Navigator.pushNamed(
                      context, AppRoutes.subjectSelectionScreen);
                },
                child: Container(color: Colors.red.withOpacity(0.5)),
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