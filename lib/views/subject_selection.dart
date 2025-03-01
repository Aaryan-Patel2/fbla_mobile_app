import 'package:flutter/material.dart';
import 'package:fbla_mobile_app/widgets/buttons.dart'; // Import the custom button
import 'package:fbla_mobile_app/routes/app_routes.dart'; // Import app routes

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
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                // Math button with a working redirect
                _buildSubjectButton(context, "Math", [Colors.blue, Colors.purple], AppRoutes.mathLevelsScreen),
                // Placeholder buttons for Science and History (No redirect functionality yet)
                _buildSubjectButton(context, "Science", [Colors.green, Colors.teal], '/science_levels'),
                _buildSubjectButton(context, "History", [Colors.brown, Colors.orange], '/history_levels'),
              ],
            ),
          ),

          // Home Button at Bottom Left
          Positioned(
            bottom: 20,
            left: 20,
            child: ReturnToHomeButton(
              onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.homeScreen),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubjectButton(
      BuildContext context, String subject, List<Color> colors, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          // Only Math button should work, others are placeholders
          if (subject == "Math") {
            Navigator.pushReplacementNamed(context, route);
          }
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
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}