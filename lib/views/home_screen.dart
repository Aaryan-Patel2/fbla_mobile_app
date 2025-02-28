import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              width: 1920, // Adjust width as needed
              height: 750, // Adjust height as needed
              child: Image.asset(
                'lib/assets/home_screen.png',
                fit: BoxFit.contain,
              ),
            ),
            // Black Buttons (Make Transparent Later)
            Positioned(
              top: 150, // Adjust based on image layout
              left: 400, // Adjust based on image layout
              width: 200, // Adjust width
              height: 100, // Adjust height
              child: GestureDetector(
                onTap: () => print("Orbit logo clicked"),
                child: Container(
                    color:
                        const Color.fromARGB(255, 226, 10, 10)), // Semi-transparent for visibility
              ),
            ),
            Positioned(
              top: 320,
              left: 150,
              width: 250,
              height: 150,
              child: GestureDetector(
                onTap: () => print("AI - Orbit clicked"),
                child: Container(color: const Color.fromARGB(244, 243, 15, 15)),
              ),
            ),
            Positioned(
              top: 320,
              left: 500,
              width: 250,
              height: 150,
              child: GestureDetector(
                onTap: () => print("Quiz clicked"),
                child: Container(color: const Color.fromARGB(243, 230, 14, 14)),
              ),
            ),
            Positioned(
              top: 500,
              left: 150,
              width: 250,
              height: 150,
              child: GestureDetector(
                onTap: () => print("Settings clicked"),
                child: Container(color: const Color.fromARGB(232, 243, 14, 14)),
              ),
            ),
            Positioned(
              top: 500,
              left: 500,
              width: 250,
              height: 150,
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