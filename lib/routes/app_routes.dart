import 'package:flutter/material.dart';
import '../features/auth/sign_in.dart';

class AppRoutes {
  static const String signInScreen = '/auth';

  static Map<String, WidgetBuilder> get routes {
    return {
      signInScreen: (context) => SignInScreen(),
    };
  }
}