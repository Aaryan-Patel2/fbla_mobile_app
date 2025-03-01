import 'package:flutter/material.dart';
import 'package:fbla_mobile_app/widgets/buttons.dart'; // Import the custom button
import 'package:fbla_mobile_app/routes/app_routes.dart'; // Import your app routes

class GameSelections extends StatefulWidget {
  const GameSelections({super.key});

  @override
  _GameSelectionsState createState() => _GameSelectionsState();
}

class _GameSelectionsState extends State<GameSelections> {
  @override
  Widget build(BuildContext context) {
    // Get screen width and height dynamically
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            // Background image set to game_options.png
            SizedBox(
              width: screenWidth, 
              height: screenHeight, // Use full screen height
              child: Image.asset(
                'lib/assets/game_options.png', // Background image
                fit: BoxFit.cover,
              ),
            ),
            // First Transparent Box (Centered)
            Positioned(
              top: screenHeight * 0.2, // Adjusted position based on screen height
              left: screenWidth * 0.05, // Centered horizontally
              width: screenWidth * 0.4, // Adjust width to make it wide
              height: screenHeight * 0.2, // Adjust height as needed
              child: GestureDetector(
                onTap: () => print("Time Trial clicked"),
                child: Container(
                  color: Colors.transparent, // Transparent tap area
                ),
              ),
            ),
            // Second Transparent Box (Centered)
            Positioned(
              top: screenHeight * 0.15, // Adjusted position based on screen height
              left: screenWidth * 0.55, // Centered horizontally
              width: screenWidth * 0.4, // Same width as the first box
              height: screenHeight * 0.2, // Same height as the first box
              child: GestureDetector(
                onTap: () => print("Quiz clicked"),
                child: Container(
                  color: Colors.transparent, // Transparent tap area
                ),
              ),
            ),
            // Third Transparent Box (Centered)
            Positioned(
              top: screenHeight * 0.5, // Adjusted position based on screen height
              left: screenWidth * 0.05, // Centered horizontally
              width: screenWidth * 0.4, // Same width as the other boxes
              height: screenHeight * 0.2, // Same height as the other boxes
              child: GestureDetector(
                onTap: () => print("Battleship clicked"),
                child: Container(
                  color: Colors.transparent, // Transparent tap area
                ),
              ),
            ),
            // Return to Home Button (Placed in the bottom left corner)
            Positioned(
              bottom: screenHeight * 0.05, // Positioned close to the bottom
              left: screenWidth * 0.05, // Positioned close to the left side
              child: ReturnToHomeButton(
                onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.homeScreen),
              ),
            ),
          ],
        ),
      ),
    );
  }
}