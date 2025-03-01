import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fbla_mobile_app/widgets/buttons.dart'; // Import the custom button

void main() {
  runApp(BattleshipGameApp());
}

class BattleshipGameApp extends StatelessWidget {
  const BattleshipGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BattleshipGameScreen(),
    );
  }
}

class BattleshipGameScreen extends StatefulWidget {
  const BattleshipGameScreen({super.key});

  @override
  _BattleshipGameScreenState createState() => _BattleshipGameScreenState();
}

class _BattleshipGameScreenState extends State<BattleshipGameScreen> {
  final List<List<String>> _grid = List.generate(5, (_) => List.filled(5, "X"));
  final Random _random = Random();
  final Set<Point<int>> _ships = {};
  String _xQuestion = "";
  String _yQuestion = "";
  final TextEditingController _answerController = TextEditingController();
  String _message = "";

  @override
  void initState() {
    super.initState();
    _placeShips();
    _generateQuestions();
  }

  void _placeShips() {
    _ships.clear();
    while (_ships.length < 5) {
      _ships.add(Point(_random.nextInt(5), _random.nextInt(5)));
    }
  }

  void _generateQuestions() {
    var ship = _ships.first;
    List<String> xQuestions = [
      "What is the derivative of (1/2)x² at x=${ship.x}?",
      "What is the derivative of (1/3)x³ at x=${ship.x}?",
      "What is the second derivative of ${ship.x / 2}x²?",
      "What is the velocity if the position is x meters at t = ${ship.x}?",
    ];
    List<String> yQuestions = [
      "What is the square root of the integral of (2x) from 0 to ${ship.y}, rounded to the nearest integer?",
      "What is the integral of 1 from 0 to ${ship.y}, rounded to the nearest integer?",
      "What is the Right Riemann Sum of ${ship.y}x² from 0 to 1 rounded to the nearest integer?",
      "What is the displacement if the velocity is 1 m/s from 0 to ${ship.y}?",
    ];
    _xQuestion = xQuestions[_random.nextInt(xQuestions.length)];
    _yQuestion = yQuestions[_random.nextInt(yQuestions.length)];
  }

  void _checkAnswer() {
    int? xAnswer = int.tryParse(_answerController.text.split(',')[0].trim());
    int? yAnswer = int.tryParse(_answerController.text.split(',')[1].trim());

    if (xAnswer == null || yAnswer == null) {
      setState(() => _message = "Invalid Input. Use format: x, y");
      return;
    }

    Point<int> guess = Point(xAnswer, yAnswer);

    setState(() {
      if (_ships.contains(guess)) {
        _grid[xAnswer][yAnswer] = "O";
        _ships.remove(guess);
        if (_ships.isEmpty) {
          _showWinDialog();
        } else {
          _message = "Hit! Keep going!";
          _generateQuestions();
        }
      } else {
        _grid[xAnswer][yAnswer] = "❌";
        _message = "Miss! Try again.";
      }
    });
  }

  void _showWinDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("You Won!"),
          content: Text("Congratulations! You sunk all the ships."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _grid.setAll(0, List.generate(5, (_) => List.filled(5, "X")));
                  _placeShips();
                  _generateQuestions();
                  _message = "";
                });
              },
              child: Text("Play Again"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title:
            Text("Battleship Calculus", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(_xQuestion,
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(_yQuestion,
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
                SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5),
                  itemCount: 25,
                  itemBuilder: (context, index) {
                    int row = index ~/ 5;
                    int col = index % 5;
                    return Container(
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        border: Border.all(color: Colors.white),
                      ),
                      child: Center(
                        child: Text(
                          _grid[row][col],
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: TextField(
                    controller: _answerController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Enter coordinates (x, y)",
                      hintStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Colors.grey[800],
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _checkAnswer,
                  child: Text("Fire!"),
                ),
                SizedBox(height: 10),
                Text(_message,
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                SizedBox(height: 20),
              ],
            ),
          ),

          // Home Button at Bottom Left
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