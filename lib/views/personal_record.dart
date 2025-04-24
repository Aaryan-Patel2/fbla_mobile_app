import 'package:flutter/material.dart';
import 'globals.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fbla_mobile_app/core/routes/app_routes.dart';

class PersonalRecordScreen extends StatefulWidget {
  const PersonalRecordScreen({super.key});

  @override
  _PersonalRecordScreenState createState() => _PersonalRecordScreenState();
}

class _PersonalRecordScreenState extends State<PersonalRecordScreen> {
  Future<void> _launchInstagram() async {
    final Uri instagramUrl = Uri.parse('https://www.instagram.com');
    if (await canLaunchUrl(instagramUrl)) {
      await launchUrl(instagramUrl);
    } else {
      throw 'Could not launch $instagramUrl';
    }
  }

  @override
  void initState() {
    super.initState();
    // Ensure UI reflects latest scores
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            // Background image
            SizedBox(
              width: screenWidth,
              height: screenHeight,
              child: Image.asset(
                'lib/assets/pr.png',
                fit: BoxFit.contain,
              ),
            ),

            // Instagram Button Area
            Positioned(
              bottom: screenHeight * 0.05,
              left: screenWidth * 0.22,
              width: screenWidth * 0.55,
              height: screenHeight * 0.07,
              child: GestureDetector(
                onTap: _launchInstagram,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),

            // Home Button Area
            Positioned(
              top: screenHeight * 0.08,
              left: screenWidth * 0.05,
              width: screenWidth * 0.8,
              height: screenHeight * 0.05,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
                },
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),

            // Top 3 Scores Display
            Positioned(
              top: screenHeight * 0.20,
              left: screenWidth * 0.15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(3, (index) {
                  final score = topAttempts.length > index
                      ? "${topAttempts[index]} asteroids"
                      : "-";
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "${index + 1}.) $score",
                      style: const TextStyle(
                        fontSize: 36,
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}