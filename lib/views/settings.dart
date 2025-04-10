import 'package:flutter/material.dart';
import 'package:fbla_mobile_app/widgets/buttons.dart'; // Import the custom button
import 'package:fbla_mobile_app/core/routes/app_routes.dart'; // Import your app routes

class UserSettings extends StatefulWidget {
  const UserSettings({super.key});

  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
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
            // Background image set to settings.png
            SizedBox(
              width: screenWidth, 
              height: screenHeight, // Use full screen height
              child: Image.asset(
                'lib/assets/settings.png', // Background image
                fit: BoxFit.cover,
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
