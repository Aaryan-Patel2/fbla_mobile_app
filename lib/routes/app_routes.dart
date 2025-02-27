import 'package:flutter/material.dart';
import '../features/auth/sign_in.dart';
import '../features/auth/sign_up.dart';

class AppRoutes {
  static const String signInScreen = '/sign-in';
  static const String signUpScreen = '/sign-up';

  static Map<String, WidgetBuilder> get routes {
    return {
      signInScreen: (context) => SignInScreen(),
      signUpScreen: (context) => SignUpScreen(),
    };
  }
}
