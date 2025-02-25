import 'package:flutter/material.dart';
import '../features/auth/auth_screen.dart';

class AppRoutes {
  static const String authScreen = '/auth';

  static Map<String, WidgetBuilder> get routes {
    return {
      authScreen: (context) => AuthScreen(),
    };
  }
}