import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package
import 'package:fbla_mobile_app/core/routes/app_routes.dart'; // Import AppRoutes

class PersonalRecordScreen extends StatefulWidget {
  const PersonalRecordScreen({super.key});

  @override
  _PersonalRecordScreenState createState() => _PersonalRecordScreenState();
}

class _PersonalRecordScreenState extends State<PersonalRecordScreen> {
  // Function to launch the Instagram URL
  Future<void> _launchInstagram() async {
    final Uri instagramUrl = Uri.parse('https://www.instagram.com');
    if (await canLaunchUrl(instagramUrl)) {  // Using canLaunchUrl with Uri
      await launchUrl(instagramUrl);  // Using launchUrl with Uri
    } else {
      throw 'Could not launch $instagramUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // final double buttonWidth = screenWidth * 0.4; // Adjust based on button size

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              width: screenWidth,
              height: screenHeight * 1,
              child: Image.asset(
                'lib/assets/pr.png', // Updated image
                fit: BoxFit.contain,
              ),
            ),

            // Instagram Button (Transparent Tap Area)
            Positioned(
              bottom: screenHeight * 0.05, // Adjusted for better placement
              left: screenWidth * 0.22, // Centered horizontally
              width: screenWidth * 0.55,
              height: screenHeight * 0.07,
              child: GestureDetector(
                onTap: _launchInstagram, // Launch Instagram when tapped
                child: Container(
                  color: Colors.transparent, // Transparent tap area
                ),
              ),
            ),

            // Transparent Box near the top-left that redirects to Home Screen
            Positioned(
              top: screenHeight * 0.08, // 0.1 * screenHeight from the top
              left: screenWidth * 0.05, // Near the left side of the screen
              width: screenWidth * 0.8, // Adjust width as needed
              height: screenHeight * 0.05, // Adjust height as needed
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
                },
                child: Container(
                  color: Colors.transparent // Transparent tap area
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}