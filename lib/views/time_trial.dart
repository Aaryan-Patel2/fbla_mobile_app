import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fbla_mobile_app/core/routes/app_routes.dart';
import 'package:fbla_mobile_app/widgets/buttons.dart';
import '../views/home_screen.dart';
import 'globals.dart';

void main() {
  runApp(MathChallengeApp());
}

class MathChallengeApp extends StatelessWidget {
  const MathChallengeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => ChallengeHomeScreen(),
        '/quiz': (context) => ChallengeScreen(
            topic: ModalRoute.of(context)?.settings.arguments as String? ??
                'Algebra'),
        AppRoutes.homeScreen: (context) => HomeScreen(),
      },
    );
  }
}

class ChallengeHomeScreen extends StatelessWidget {
  const ChallengeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            // Go to Challenge Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/quiz',
                      arguments:
                          'Algebra'); // Adjust the argument based on the selected topic
                },
                child: Text("Go to Challenge"),
              ),
            ),
            // Return to Home Button (bottom center)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ReturnToHomeButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.homeScreen);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChallengeScreen extends StatefulWidget {
  final String topic;

  const ChallengeScreen({super.key, required this.topic});

  @override
  _ChallengeScreenState createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  final TextEditingController _controller = TextEditingController();
  int _questionIndex = 0;
  String _feedback = "";
  int _correctAnswers = 0;
  int _secondsRemaining = 60;
  Timer? _timer;

  late final List<Map<String, dynamic>> _questions;

  @override
  void initState() {
    super.initState();
    _questions = _getQuestionsForTopic();
    _startTimer();
  }

  List<Map<String, dynamic>> _getQuestionsForTopic() {
    if (level == 1) {
      // Trigonometry
      return [
        {"question": "What is sin(90°)?", "answer": "1"},
        {"question": "What is cos(0°)?", "answer": "1"},
        {"question": "What is tan(45°)?", "answer": "1"},
      ];
    } else if (level == 2) {
      // Calculus
      return [
        {"question": "What is the derivative of x²?", "answer": "2x"},
        {"question": "What is the integral of 3x²?", "answer": "x3"},
        {"question": "What is the derivative of sin(x)?", "answer": "cos(x)"},
      ];
    } else {
      // Default to Algebra
      return [
        {"question": "Solve for x: 2x + 3 = 7", "answer": "2"},
        {"question": "Simplify: (x + 2)(x - 2)", "answer": "x2-4"},
        {"question": "What is 3x if x = 4?", "answer": "12"},
      ];
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _timer?.cancel();
        _showResults();
      }
    });
  }

  void _checkAnswer() {
    String userAnswer = _controller.text.trim();
    if (userAnswer == _questions[_questionIndex]["answer"]) {
      setState(() {
        _feedback = "Correct!";
        _correctAnswers++;
      });
    } else {
      setState(() {
        _feedback = "Wrong! Try again.";
      });
    }
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex = (_questionIndex + 1) % _questions.length;
      _feedback = "";
      _controller.clear();
    });
  }

  void _showResults() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text("Time's Up!"),
        content: Text("You got $_correctAnswers correct answers!"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
            },
            child: Text("Go Home"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_questionIndex]["question"];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // Timer
                Text("Time Remaining: $_secondsRemaining s",
                    style: TextStyle(fontSize: 24, color: Colors.redAccent)),
                const SizedBox(height: 20),

                // Question Box
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient:
                        LinearGradient(colors: [Colors.blue, Colors.purple]),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    currentQuestion,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),

                const SizedBox(height: 20),

                // Answer Box
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient:
                        LinearGradient(colors: [Colors.blue, Colors.purple]),
                  ),
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Answer Here:",
                      hintStyle: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Submit Button
                GestureDetector(
                  onTap: _checkAnswer,
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.blueAccent),
                    ),
                    child: Text("Submit",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),

                const SizedBox(height: 10),

                // Feedback
                Text(
                  _feedback,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),

                const SizedBox(height: 10),

                // Next Question Button
                ElevatedButton(
                  onPressed: _nextQuestion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: Text("Next Question"),
                ),
              ],
            ),
          ),

          // Return to Home Button at the bottom-center of the screen
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ReturnToHomeButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}