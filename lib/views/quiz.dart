import 'package:flutter/material.dart';
import 'package:fbla_mobile_app/widgets/buttons.dart'; // Import the buttons.dart file
import 'package:fbla_mobile_app/views/globals.dart';
import 'package:fbla_mobile_app/core/routes/app_routes.dart'; // Import the app routes

void main() {
  runApp(CalculusQuizApp());
}

class CalculusQuizApp extends StatelessWidget {
  const CalculusQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => QuizHomeScreen(), // Updated class name
        '/quiz': (context) => QuizScreen(),
      },
    );
  }
}

class QuizHomeScreen extends StatelessWidget {
  const QuizHomeScreen({super.key});
  // Updated class name
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushReplacementNamed(context, '/quiz'),
          child: Text("Go to Quiz"),
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final TextEditingController _controller = TextEditingController();
  int _questionIndex = 0;
  String _feedback = "";

  List<Map<String, dynamic>> _questions() {
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
        {"question": "What is the integral of 3x²?", "answer": "x³"},
        {"question": "What is the derivative of sin(x)?", "answer": "cos(x)"},
      ];
    } else {
      // Default to Algebra
      return [
        {"question": "Solve for x: 2x + 3 = 7", "answer": "2"},
        {"question": "Simplify: (x + 2)(x - 2)", "answer": "x²-4"},
        {"question": "What is 3x if x = 4?", "answer": "12"},
      ];
    }
  }

  void _checkAnswer() {
    String userAnswer = _controller.text.trim();
    if (userAnswer == _questions()[_questionIndex]["answer"]) {
      setState(() {
        _feedback = "Correct! ✅";
      });
    } else {
      setState(() {
        _feedback = "Wrong! ❌ Try again.";
      });
    }
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex = (_questionIndex + 1) % _questions().length;
      _feedback = "";
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
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
                // Title
                Row(
                  children: [
                    Text("QUIZ ",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent)),
                    Icon(Icons.sports_esports, color: Colors.blueAccent),
                  ],
                ),
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
                    _questions()[_questionIndex]["question"],
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

          // Home Button at Bottom Left
          Positioned(
            bottom: 20,
            left: 20,
            child: ReturnToHomeButton(
              onPressed: () => 
              Navigator.pushReplacementNamed(context, AppRoutes.testHomeScreen), // Use the correct route
            ),
          ),
        ],
      ),
    );
  }
}