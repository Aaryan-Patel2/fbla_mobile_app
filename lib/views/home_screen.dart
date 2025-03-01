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
              top: screenHeight * 0.2, // Adjust based on percentage of screen height
              left: screenWidth * 0.25, // Adjust based on percentage of screen width
              width: screenWidth * 0.15, // Adjust width relative to screen
              height: screenHeight * 0.12, // Adjust height relative to screen
              child: GestureDetector(
                onTap: () => print("Orbit logo clicked"),
                child: Container(
                  color: const Color.fromARGB(255, 226, 10, 10), // Placeholder for visibility
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.43,
              left: screenWidth * 0.08,
              width: screenWidth * 0.18,
              height: screenHeight * 0.15,
              child: GestureDetector(
                onTap: () => print("AI - Orbit clicked"),
                child: Container(color: const Color.fromARGB(244, 243, 15, 15)),
              ),
            ),
            Positioned(
              top: screenHeight * 0.43,
              left: screenWidth * 0.30,
              width: screenWidth * 0.18,
              height: screenHeight * 0.15,
              child: GestureDetector(
                onTap: () => print("Quiz clicked"),
                child: Container(color: const Color.fromARGB(243, 230, 14, 14)),
              ),
            ),
            Positioned(
              top: screenHeight * 0.65,
              left: screenWidth * 0.08,
              width: screenWidth * 0.18,
              height: screenHeight * 0.15,
              child: GestureDetector(
                onTap: () => print("Settings clicked"),
                child: Container(color: const Color.fromARGB(232, 243, 14, 14)),
              ),
            ),
            Positioned(
              top: screenHeight * 0.65,
              left: screenWidth * 0.30,
              width: screenWidth * 0.18,
              height: screenHeight * 0.15,
              child: GestureDetector(
                onTap: () => print("Best Efforts clicked"),
                child: Container(color: const Color.fromARGB(237, 236, 11, 11)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}