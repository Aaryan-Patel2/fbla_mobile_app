import 'package:flutter/material.dart';
import '../views/sign_in.dart';
import '../views/sign_up.dart';
import '../views/home_screen.dart';

class AppRoutes {
  static const String signInScreen = '/sign-in';
  static const String signUpScreen = '/sign-up';
  static const String homeScreen = '/home';

  static Map<String, WidgetBuilder> get routes {
    return {
      signInScreen: (context) => SignInScreen(),
      signUpScreen: (context) => SignUpScreen(),
      homeScreen: (context) => HomeScreen(),
    };
  }
}
