import 'package:flutter/material.dart';
import '../../views/sign_in.dart';
import '../../views/sign_up.dart';
import '../../views/home_screen.dart';
import '../../views/quiz.dart';
import '../../views/battleship.dart';
import '../../views/time_trial.dart';
import '../../views/personal_record.dart';
import '../../views/subject_selection.dart';
import '../../views/game_types.dart';
import '../../views/settings.dart';
import '../../views/math_levels.dart';
import '../../views/chatbot.dart';
import 'package:fbla_mobile_app/features/auth/view/new_sign_up.dart' as tSignUp; 
import 'package:fbla_mobile_app/features/auth/view/new_sign_in.dart' as tSignIn;

class AppRoutes {
  static const String signInScreen = '/sign-in';
  static const String signUpScreen = '/sign-up';
  static const String homeScreen = '/home';
  static const String quizScreen = '/quiz';
  static const String battleshipScreen = '/battleship';
  static const String timeTrialScreen = '/time-trial';
  static const String mathLevelsScreen = '/math-levels';
  static const String prScreen = '/pr-screen';
  static const String subjectSelectionScreen = '/subject-selection';
  static const String gameSelectionScreen = '/game-selections';
  static const String settingsScreen = '/settings';
  static const String chatScreen = '/chat';

  // 🔽 New test routes
  static const String testSignInScreen = '/test-sign-in';
  static const String testSignUpScreen = '/test-sign-up';

  static Map<String, WidgetBuilder> get routes {
    return {
      signInScreen: (context) => SignInScreen(),
      signUpScreen: (context) => SignUpScreen(),
      homeScreen: (context) => HomeScreen(),
      quizScreen: (context) => QuizScreen(),
      battleshipScreen: (context) => BattleshipGameScreen(),
      timeTrialScreen: (context) => MathChallengeApp(),
      mathLevelsScreen: (context) => MathLevelsScreen(),
      prScreen: (context) => PersonalRecordScreen(),
      subjectSelectionScreen: (context) => SubjectSelectionScreen(),
      gameSelectionScreen: (context) => GameSelections(),
      settingsScreen: (context) => UserSettings(),
      chatScreen: (context) => ChatScreen(),

      // ✅ Test routes
      testSignInScreen: (context) => tSignIn.SignInScreen(),
      testSignUpScreen: (context) => tSignUp.SignUpScreen(),
    };
  }
}

