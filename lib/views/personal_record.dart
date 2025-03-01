import 'package:flutter/material.dart';
import 'package:fbla_mobile_app/widgets/buttons.dart'; // Import the custom button

class PersonalRecordScreen extends StatefulWidget {
  const PersonalRecordScreen({super.key});

  @override
  _PersonalRecordScreenState createState() => _PersonalRecordScreenState();
}

class _PersonalRecordScreenState extends State<PersonalRecordScreen> {
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
              height: screenHeight * 0.8,
              child: Image.asset(
                'lib/assets/pr.png', // Updated image
                fit: BoxFit.contain,
              ),
            ),
            
            // Instagram Button (Transparent Tap Area)
            Positioned(
              bottom: screenHeight * 0.1 + 50, // Adjusted to accommodate home button
              left: screenWidth * 0.3, // Centered horizontally
              width: screenWidth * 0.4,
              height: screenHeight * 0.08,
              child: GestureDetector(
                onTap: () => print("Share to Instagram clicked"),
                child: Container(
                  color: Colors.transparent, // Transparent tap area
                ),
              ),
            ),

            // Return to Home Button
            Positioned(
              bottom: screenHeight * 0.1, // 10 pixels below Instagram button
              left: (screenWidth - 150) / 2, // Centered horizontally
              child: ReturnToHomeButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}