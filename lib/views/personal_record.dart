import 'package:flutter/material.dart';
import 'package:fbla_mobile_app/widgets/buttons.dart'; // Import the custom button
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package

class PersonalRecordScreen extends StatefulWidget {
  const PersonalRecordScreen({super.key});

  @override
  _PersonalRecordScreenState createState() => _PersonalRecordScreenState();
}

class _PersonalRecordScreenState extends State<PersonalRecordScreen> {
  // Function to launch the Instagram URL
  Future<void> _launchInstagram() async {
    const instagramUrl = 'https://www.instagram.com';
    if (await canLaunch(instagramUrl)) {
      await launch(instagramUrl);
    } else {
      throw 'Could not launch $instagramUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final double buttonWidth = screenWidth * 0.4; // Adjust based on button size

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
              bottom: screenHeight * 0.03, // Adjusted for better placement
              left: screenWidth * 0.3, // Centered horizontally
              width: screenWidth * 0.4,
              height: screenHeight * 0.08,
              child: GestureDetector(
                onTap: _launchInstagram, // Launch Instagram when tapped
                child: Container(
                  color: Colors.transparent, // Transparent tap area
                ),
              ),
            ),

            // Return to Home Button (Slightly above Instagram button)
            Positioned(
              bottom: screenHeight * 0.1 + screenHeight * 0.12, // Slightly above the Instagram button
              left: screenWidth * 0.01 - (buttonWidth / 2), // Centered horizontally
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