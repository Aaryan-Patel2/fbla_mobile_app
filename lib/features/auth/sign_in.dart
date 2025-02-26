import 'package:flutter/material.dart';
import 'package:fbla_mobile_app/widgets/buttons.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';


class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWide = constraints.maxWidth > 600; // Adapt based on screen width


        return Scaffold(
          backgroundColor: const Color.fromRGBO(16, 20, 28, 1),
          body: Center(
            child: Container(
              padding: EdgeInsets.all(isWide ? 32.0 : 16.0),
              width: isWide ? 400 : double.infinity, // Restrict width on wider screens
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GradientText(
                    'Welcome Back',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    colors: [
                      Color.fromRGBO(127, 219, 255, 1),
                      Color.fromRGBO(66, 126, 235, 1),
                      Color.fromRGBO(78, 74, 242, 1),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildTextField('Email'),
                  const SizedBox(height: 16),
                  _buildTextField('Password', obscureText: true),
                  const SizedBox(height: 24),
                  GradientButton(
                    text: 'Login',
                    onPressed: () {},
                  ),
                  if (!isWide) ...[
                    const SizedBox(height: 16),
                    const Text(
                      "Don't have an account? Sign up",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField(String hint, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }
}
