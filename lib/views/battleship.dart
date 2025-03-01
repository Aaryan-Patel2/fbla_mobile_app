import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(BattleshipGameApp());
}

class BattleshipGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BattleshipGameScreen(),
    );
  }
}

class BattleshipGameScreen extends StatefulWidget {
  @override
  _BattleshipGameScreenState createState() => _BattleshipGameScreenState();
}

class _BattleshipGameScreenState extends State<BattleshipGameScreen> {
  final List<List<String>> _grid = List.generate(5, (_) => List.filled(5, "X"));
  final Random _random = Random();
  late int _shipX, _shipY;
  String _xQuestion = "", _yQuestion = "";
  TextEditingController _answerController = TextEditingController();
  String _message = "";

  @override
  void initState() {
    super.initState();
    _placeShip();
    _generateQuestions();
  }

  void _placeShip() {
    _shipX = _random.nextInt(5);
    _shipY = _random.nextInt(5);
  }

  void _generateQuestions() {
    _xQuestion = "What is the derivative of x² at x=${_shipX + 1}?";
    _yQuestion = "What is the integral of 2x from 0 to ${_shipY}?";
  }

  void _checkAnswer() {
    int? xAnswer = int.tryParse(_answerController.text.split(',')[0].trim());
    int? yAnswer = int.tryParse(_answerController.text.split(',')[1].trim());

    if (xAnswer == null || yAnswer == null) {
      setState(() => _message = "Invalid Input. Use format: x, y");
      return;
    }

    setState(() {
      if (xAnswer == _shipX && yAnswer == _shipY) {
        _grid[_shipX][_shipY] = "O";
        _message = "Hit! You sunk the ship!";
      } else {
        _grid[xAnswer][yAnswer] = "❌";
        _message = "Miss! Try again.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Battleship Calculus", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView( // Wrap body in a scroll view to prevent overflow
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_xQuestion, style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_yQuestion, style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
            SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
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
            Text(_message, style: TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
      ),
      
      // Home Button at Bottom Left
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Positioned(
          bottom: 20,
          left: 20,
          child: GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(context, '/home'), // Adjusted to the correct route
            child: Image.asset(
              'lib/assets/home_button.png',
              width: 50,  // Adjust size if needed
              height: 50, // Adjust size if needed
            ),
          ),
        ),
      ),
    );
  }
}