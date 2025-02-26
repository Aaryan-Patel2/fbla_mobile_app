import 'package:flutter/material.dart';

class AppTheme {
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color.fromRGBO(78, 74, 242, 1),
      Color.fromRGBO(66, 126, 235, 1),  
      Color.fromRGBO(127, 219, 255, 1), 
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [
      Color.fromRGBO(34, 40, 52, 1),
      Color.fromRGBO(71, 80, 101, 1),
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );
}