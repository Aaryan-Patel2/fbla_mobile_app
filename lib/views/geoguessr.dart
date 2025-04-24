import 'package:flutter/material.dart';
import 'globals.dart';
import 'dart:math';
import 'package:fbla_mobile_app/widgets/buttons.dart';

class GeoGuesserScreen extends StatefulWidget {
  const GeoGuesserScreen({super.key});

  @override
  State<GeoGuesserScreen> createState() => _GeoGuesserScreenState();
}

class _GeoGuesserScreenState extends State<GeoGuesserScreen> {
  final TextEditingController _controller = TextEditingController();
  String feedback = "";
  int currentIndex = 0;

  late List<Map<String, String>> imageData;

  @override
  void initState() {
    super.initState();
    imageData = _getImageData();
    imageData.shuffle(Random()); // Shuffle for variety
  }

  List<Map<String, String>> _getImageData() {
    switch (historyLevel) {
      case 0: // World
        return [
          {
            "path": "lib/assets/images/world/eiffel_tower.jpg",
            "answer": "Paris"
          },
          {"path": "lib/assets/images/world/great_wall.jpg", "answer": "China"},
        ];
      case 1: // American
        return [
          {
            "path": "lib/assets/images/american/statue_of_liberty.jpg",
            "answer": "New York"
          },
          {
            "path": "lib/assets/images/american/mount_rushmore.jpg",
            "answer": "South Dakota"
          },
        ];
      case 2: // European
        return [
          {
            "path": "lib/assets/images/european/colosseum.jpg",
            "answer": "Rome"
          },
          {
            "path": "lib/assets/images/european/big_ben.jpg",
            "answer": "London"
          },
        ];
      default:
        return [];
    }
  }

  void _checkAnswer() {
    final userAnswer = _controller.text.trim().toLowerCase();
    final correctAnswer = imageData[currentIndex]["answer"]!.toLowerCase();

    setState(() {
      if (userAnswer == correctAnswer) {
        feedback = "✅ Correct!";
        if (currentIndex < imageData.length - 1) {
          currentIndex++;
          _controller.clear();
        } else {
          feedback = "🎉 You've completed the round!";
        }
      } else {
        feedback = "❌ Try again!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (imageData.isEmpty) {
      return Scaffold(
        body: Center(child: Text("No images available.")),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imageData[currentIndex]["path"]!,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _controller,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Enter location...",
                    hintStyle: TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _checkAnswer,
                  child: Text("Check Answer"),
                ),
                SizedBox(height: 10),
                Text(
                  feedback,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          // Home button positioned at the bottom left
          Positioned(
            bottom: 20,
            left: 20,
            child: ReturnToHomeButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
            ),
          ),
        ],
      ),
    );
  }
}