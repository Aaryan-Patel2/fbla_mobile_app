import 'package:flutter/material.dart';
import 'home_widgets.dart'; // Import the separate widget file for modularity

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 402,
        height: 874,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Color(0xFF10141C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          shadows: [
            BoxShadow(
              color: Color(0xFF516C8F),
              blurRadius: 100,
              offset: Offset(0, 30),
              spreadRadius: 0,
            )
          ],
        ),
        child: Stack(
          children: [
            // Place the individual widgets here
            Positioned(
              left: 8,
              top: 0,
              child: HomeScreenHeader(),
            ),
            Positioned(
              left: 14,
              top: 44,
              child: HomeScreenTitle(),
            ),
            Positioned(
              left: 88,
              top: 655,
              child: SignUpButton(),
            ),
            Positioned(
              left: 88,
              top: 739,
              child: LogInButton(),
            ),
            Positioned(
              left: -1.71,
              top: 113.72,
              child: HomeScreenBackground(),
            ),
          ],
        ),
      ),
    );
  }
}
