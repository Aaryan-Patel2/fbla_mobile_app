import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            SizedBox(
              width: screenWidth, // Make image responsive
              height: screenHeight * 0.8, // Adjust height proportionally
              child: Image.asset(
                'lib/assets/home_screen.png',
                fit: BoxFit.contain,
              ),
            ),
            // Black Buttons (Now Responsive)
            Positioned(
              top: screenHeight * 0.1, // Adjust based on percentage of screen height
              left: screenWidth * 0.4, // Adjust based on percentage of screen width
              width: screenWidth * 0.15, // Adjust width relative to screen
              height: screenHeight * 0.12, // Adjust height relative to screen
              child: GestureDetector(
                onTap: () => print("Orbit logo clicked"),
                child: Container(
                  color: Colors.transparent, // Placeholder for visibility
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.37,
              left: screenWidth * 0.15,
              width: screenWidth * 0.18,
              height: screenHeight * 0.15,
              child: GestureDetector(
                onTap: () => print("AI - Orbit clicked"),
                child: Container(color: Colors.transparent),
              ),
            ),
            Positioned(
              top: screenHeight * 0.35,
              left: screenWidth * 0.63,
              width: screenWidth * 0.18,
              height: screenHeight * 0.15,
              child: GestureDetector(
                onTap: () => print("Quiz clicked"),
                child: Container(color: Colors.transparent),
              ),
            ),
            Positioned(
              top: screenHeight * 0.60,
              left: screenWidth * 0.15,
              width: screenWidth * 0.18,
              height: screenHeight * 0.15,
              child: GestureDetector(
                onTap: () => print("Settings clicked"),
                child: Container(color: Colors.transparent),
              ),
            ),
            Positioned(
              top: screenHeight * 0.58,
              left: screenWidth * 0.60,
              width: screenWidth * 0.18,
              height: screenHeight * 0.15,
              child: GestureDetector(
                onTap: () => print("Best Efforts clicked"),
                child: Container(color: Colors.transparent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}