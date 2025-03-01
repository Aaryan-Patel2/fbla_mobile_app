import 'package:flutter/material.dart';
import '../views/sign_in.dart';
import '../views/sign_up.dart';
import '../views/home_screen.dart';
import '../views/quiz.dart'; // Add the path for QuizScreen
import '../views/battleship.dart'; // Add the path for BattleshipGameScreen

class AppRoutes {
  static const String signInScreen = '/sign-in';
  static const String signUpScreen = '/sign-up';
  static const String homeScreen = '/home';
  static const String quizScreen = '/quiz'; // Path for QuizScreen
  static const String battleshipScreen = '/battleship'; // Path for BattleshipGameScreen

  static Map<String, WidgetBuilder> get routes {
    return {
      signInScreen: (context) => SignInScreen(),
      signUpScreen: (context) => SignUpScreen(),
      homeScreen: (context) => HomeScreen(),
      quizScreen: (context) => QuizScreen(), // Add route for QuizScreen
      battleshipScreen: (context) => BattleshipGameScreen(), // Add route for BattleshipGameScreen
    };
  }
}
