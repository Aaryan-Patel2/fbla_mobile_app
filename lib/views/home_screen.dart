import 'package:flutter/material.dart';
import 'package:fbla_mobile_app/routes/app_routes.dart';
import '../globals.dart';

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
              height: screenHeight, // Adjust height proportionally
              child: Image.asset(
                'lib/assets/home_screen.png',
                fit: BoxFit.contain,
              ),
            ),
            // Orbit Logo Click (Currently doesn't navigate anywhere)
            Positioned(
              top: screenHeight * 0.15,
              left: screenWidth * 0.4,
              width: screenWidth * 0.15,
              height: screenHeight * 0.12,
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context,
                    AppRoutes.gameSelectionScreen), // No navigation yet
                child: Container(color: Colors.transparent),
              ),
            ),
            // AI - Orbit
            Positioned(
              top: screenHeight * 0.50,
              left: screenWidth * 0.15,
              width: screenWidth * 0.18,
              height: screenHeight * 0.15,
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, AppRoutes.chatScreen),
                child: Container(color: Colors.transparent),
              ),
            ),
            // Quiz
            Positioned(
              top: screenHeight * 0.45,
              left: screenWidth * 0.63,
              width: screenWidth * 0.18,
              height: screenHeight * 0.15,
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
            // Settings
            Positioned(
              top: screenHeight * 0.75,
              left: screenWidth * 0.15,
              width: screenWidth * 0.18,
              height: screenHeight * 0.15,
              child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.settingsScreen),
                child: Container(color: Colors.transparent),
              ),
            ),
            // Best Efforts (Personal Record)
            Positioned(
              top: screenHeight * 0.70,
              left: screenWidth * 0.60,
              width: screenWidth * 0.18,
              height: screenHeight * 0.15,
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, AppRoutes.prScreen),
                child: Container(color: Colors.transparent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}