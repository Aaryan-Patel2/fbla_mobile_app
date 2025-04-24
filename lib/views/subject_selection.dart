import 'package:flutter/material.dart';
import 'package:fbla_mobile_app/widgets/buttons.dart'; // Custom home button widget
import 'package:fbla_mobile_app/core/routes/app_routes.dart'; // Route constants
import 'globals.dart';

// Make sure this global variable is declared somewhere globally
// int gameMode = 0;

class SubjectSelectionScreen extends StatelessWidget {
  const SubjectSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Choose a Subject",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                _buildSubjectButton(
                  context,
                  "Math",
                  [Colors.blue, Colors.purple],
                  AppRoutes.mathLevelsScreen,
                  0,
                ),
                _buildSubjectButton(
                  context,
                  "Science",
                  [Colors.green, Colors.teal],
                  AppRoutes.scienceLevelsScreen,
                  1,
                ),
                _buildSubjectButton(
                  context,
                  "History",
                  [Colors.brown, Colors.orange],
                  AppRoutes.geographyLevelsScreen,
                  2,
                ),
              ],
            ),
          ),
          // Home Button at Bottom Left
          Positioned(
            bottom: 20,
            left: 20,
            child: ReturnToHomeButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, AppRoutes.homeScreen),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubjectButton(
    BuildContext context,
    String subject,
    List<Color> colors,
    String route,
    int mode,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          gameMode = mode;
          Navigator.pushReplacementNamed(context, route);
        },
        child: Container(
          width: 250,
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(colors: colors),
          ),
          child: Text(
            subject,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}