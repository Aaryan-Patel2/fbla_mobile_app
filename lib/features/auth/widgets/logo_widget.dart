import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 149,
      height: 67.78,
      child: Stack(
        children: [
          const Positioned(
            left: 0,
            top: 0,
            child: Text(
              'ORBIT',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF4E4AF2),
                fontSize: 47.07,
                fontFamily: 'Koulen',
                fontWeight: FontWeight.w400,
                letterSpacing: -0.07,
              ),
            ),
          ),
          Positioned(
            left: 110,
            top: 20.95,
            child: Container(
              width: 39.01,
              height: 39.01,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0, 1),
                  colors: [Color(0xFF4E4AF2), Color(0xFF7FDBFF)],
                ),
                shape: BoxShape.circle,
              ),
              child: Stack(
                children: [
                  // Add your small circle decorations here
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}