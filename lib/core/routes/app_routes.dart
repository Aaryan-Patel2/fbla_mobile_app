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
import '../../views/geoguessr.dart';
import '../../views/history_levels.dart';
import '../../views/asteroid.dart';
import '/../../views/science_levels.dart';


import 'package:fbla_mobile_app/features/auth/view/new_sign_up.dart' as tSignUp; 
import 'package:fbla_mobile_app/features/auth/view/new_sign_in.dart' as tSignIn;
import 'package:fbla_mobile_app/features/home/view/home_screen.dart' as tHomeScreen;
import 'package:fbla_mobile_app/features/bug_report/view/bug_report_screen.dart' as tBugReportScreen;
import 'package:fbla_mobile_app/features/settings/view/settings_screen.dart' as tSettingsScreen;

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
  static const String geographyLevelsScreen = '/history-levels';
  static const String geoguesserScreen = '/geoguesser';
  static const String asteroidScreen = '/asteroid';
  static const String scienceLevelsScreen = '/science-levels';

  // 🔽 New test routes
  static const String testSignInScreen = '/test-sign-in';
  static const String testSignUpScreen = '/test-sign-up';
  static const String testHomeScreen = '/test-home-screen';
  static const String testBugReportsScreen = '/test-bug-report-screen';
  static const String testSettingsScreen = '/test-settings-screen';

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
      geographyLevelsScreen: (context) => GeographyLevelsScreen(),
      geoguesserScreen: (context) => GeoGuesserScreen(),
      asteroidScreen: (context) => AsteroidGameScreen(),
      scienceLevelsScreen: (context) => ScienceLevelsScreen(),

      // ✅ Test routes
      testSignInScreen: (context) => tSignIn.SignInScreen(),
      testSignUpScreen: (context) => tSignUp.SignUpScreen(),
      testHomeScreen: (context) => tHomeScreen.HomeScreen(),
      testBugReportsScreen: (context) => tBugReportScreen.BugReportScreen(),
      testSettingsScreen: (context) => tSettingsScreen.SettingsScreen(),
    };
  }
}

