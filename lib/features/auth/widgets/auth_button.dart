import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AuthButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 225,
      height: 50,
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(0.93, -0.37),
          end: Alignment(-0.93, 0.37),
          colors: [Color(0xFF353F54), Color(0xFF222834)],
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1.31, color: Color(0xFF4E4AF2)),
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 5.24,
            offset: Offset(0, 5.24),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF7FDBFF),
            fontSize: 15,
            fontFamily: 'Lohit Devanagari',
            fontWeight: FontWeight.w400,
            letterSpacing: -0.09,
          ),
        ),
      ),
    );
  }
}