import 'package:fbla_mobile_app/views/math_levels.dart';
import 'package:flutter/material.dart';
import '../views/sign_in.dart';
import '../views/sign_up.dart';
import '../views/home_screen.dart';
import '../views/quiz.dart'; // Add the path for QuizScreen
import '../views/battleship.dart'; // Add the path for BattleshipGameScreen
import '../views/time_trial.dart';
import '../views/personal_record.dart';
import '../views/subject_selection.dart';
import '../views/game_types.dart';
import '../views/settings.dart';

class AppRoutes {
  static const String signInScreen = '/sign-in';
  static const String signUpScreen = '/sign-up';
  static const String homeScreen = '/home';
  static const String quizScreen = '/quiz'; // Path for QuizScreen
  static const String battleshipScreen = '/battleship'; // Path for BattleshipGameScreen
  static const String timeTrialScreen = '/time-trial';
  static const String mathLevelsScreen = '/math-levels';
  static const String prScreen = '/pr-screen';
  static const String subjectSelectionScreen = '/subject-selection';
  static const String gameSelectionScreen = '/game-selections';
  static const String settingsScreen = '/settings';

  static Map<String, WidgetBuilder> get routes {
    return {
      signInScreen: (context) => SignInScreen(),
      signUpScreen: (context) => SignUpScreen(),
      homeScreen: (context) => HomeScreen(),
      quizScreen: (context) => QuizScreen(), // Add route for QuizScreen
      battleshipScreen: (context) => BattleshipGameScreen(), // Add route for BattleshipGameScreen
      timeTrialScreen: (context) => MathChallengeApp(),
      mathLevelsScreen: (context) => MathLevelsScreen(),
      prScreen: (context) => PersonalRecordScreen(),
      subjectSelectionScreen: (context) => SubjectSelectionScreen(),
      gameSelectionScreen: (context) => GameSelections(),
      settingsScreen: (context) => UserSettings(),
    };
  }
}
