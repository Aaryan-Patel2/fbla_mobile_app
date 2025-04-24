import 'dart:async';
import 'dart:math';
import 'globals.dart';
import 'package:flutter/material.dart';
import 'package:fbla_mobile_app/widgets/buttons.dart';

void main() => runApp(AsteroidGameApp());

class AsteroidGameApp extends StatelessWidget {
  const AsteroidGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AsteroidGameScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AsteroidGameScreen extends StatefulWidget {
  const AsteroidGameScreen({super.key});

  @override
  _AsteroidGameScreenState createState() => _AsteroidGameScreenState();
}

class _AsteroidGameScreenState extends State<AsteroidGameScreen> {
  double playerX = 0;
  double asteroidX = 0;
  double asteroidY = -1;
  String currentQuestion = "";
  String correctAnswer = "";
  final TextEditingController _answerController = TextEditingController();
  Timer? _asteroidTimer;
  bool asteroidVisible = true;
  bool _isShooting = false;
  int currentScore = 0;

  @override
  void initState() {
    super.initState();
    _generateNewQuestion();
    _startAsteroidFall();
  }

  void _generateNewQuestion() {
    final random = Random();
    final questions = _questions();
    final questionData = questions[random.nextInt(questions.length)];

    currentQuestion = questionData["question"];
    correctAnswer = questionData["answer"];
    asteroidX = [-0.75, -0.5, -0.25, 0.0, 0.25, 0.5, 0.75][random.nextInt(7)];
    asteroidY = -1;
    asteroidVisible = true;
  }

  void _startAsteroidFall() {
    _asteroidTimer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        asteroidY += 0.01;
      });

      if (asteroidY > 1) {
        _updateTopAttempts(currentScore);
        currentScore = 0;
        _generateNewQuestion();
      }
    });
  }

  void _movePlayer(String direction) {
    setState(() {
      if (direction == 'left' && playerX > -0.9) {
        playerX -= 0.25;
      } else if (direction == 'right' && playerX < 0.9) {
        playerX += 0.25;
      }
    });
  }

  void _shootAnswer() {
    String answer = _answerController.text.trim();

    setState(() {
      _isShooting = true;
    });

    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        _isShooting = false;
      });
    });

    if (answer == correctAnswer &&
        (playerX - asteroidX).abs() < 0.1 &&
        asteroidY < 0.65 &&
        asteroidVisible) {
      setState(() {
        asteroidVisible = false;
        _answerController.clear();
        currentScore++;
      });
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          _generateNewQuestion();
        });
      });
    }
  }

  void _updateTopAttempts(int score) {
    topAttempts.add(score);
    topAttempts.sort((a, b) => b.compareTo(a));
    if (topAttempts.length > 3) {
      topAttempts = topAttempts.sublist(0, 3);
    }
  }

  @override
  void dispose() {
    _asteroidTimer?.cancel();
    _answerController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> _questions() {
    if (level == 1) {
      return [
        {"question": "What is sin(90°)?", "answer": "1"},
        {"question": "What is cos(0°)?", "answer": "1"},
        {"question": "What is tan(45°)?", "answer": "1"},
      ];
    } else if (level == 2) {
      return [
        {"question": "What is the derivative of x²?", "answer": "2x"},
        {"question": "What is the integral of 3x²?", "answer": "x3"},
        {"question": "What is the derivative of sin(x)?", "answer": "cos(x)"},
      ];
    } else {
      return [
        {"question": "Solve for x: 2x + 3 = 7", "answer": "2"},
        {"question": "Simplify: (x + 2)(x - 2)", "answer": "x2-4"},
        {"question": "What is 3x if x = 4?", "answer": "12"},
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Question text
            Positioned(
              top: 30,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  currentQuestion,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            // Top attempts display
            Positioned(
              top: 60,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Top Scores:",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  for (var i = 0; i < topAttempts.length; i++)
                    Text("Attempt ${i + 1}: ${topAttempts[i]}",
                        style: TextStyle(color: Colors.white)),
                ],
              ),
            ),

            // Asteroid
            if (asteroidVisible)
              Positioned(
                top: screenHeight * (asteroidY / 2 + 0.5),
                left: screenWidth * (asteroidX + 1) / 2 - 25,
                child: Image.asset(
                  'lib/assets/home_button.png',
                  width: 50,
                  height: 50,
                ),
              ),

            // Laser beam
            if (_isShooting)
              Positioned(
                bottom: 190,
                left: screenWidth / 2 + playerX * screenWidth / 2 - 2,
                child: Container(
                  width: 4,
                  height: screenHeight * 0.6,
                  color: Colors.redAccent,
                ),
              ),

            // Player Cannon
            Align(
              alignment: Alignment(0, 1),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 150),
                child: Transform.translate(
                  offset: Offset(playerX * screenWidth / 2, 0),
                  child: Image.asset(
                    'lib/assets/cannon.png',
                    width: 60,
                    height: 60,
                  ),
                ),
              ),
            ),

            // Home Button
            Positioned(
              bottom: 20,
              left: 20,
              child: ReturnToHomeButton(
                onPressed: () {
                  _updateTopAttempts(currentScore);
                  Navigator.pushReplacementNamed(context, '/home');
                },
              ),
            ),

            // Controls
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _answerController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "Enter answer",
                              hintStyle: TextStyle(color: Colors.white54),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: _shootAnswer,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          child: Text("Shoot"),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_left, color: Colors.white),
                        onPressed: () => _movePlayer('left'),
                        iconSize: 40,
                      ),
                      SizedBox(width: 50),
                      IconButton(
                        icon: Icon(Icons.arrow_right, color: Colors.white),
                        onPressed: () => _movePlayer('right'),
                        iconSize: 40,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}