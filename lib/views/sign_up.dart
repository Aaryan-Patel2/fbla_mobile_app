import 'package:flutter/material.dart';
import 'package:fbla_mobile_app/widgets/buttons.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:fbla_mobile_app/routes/app_routes.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import for SVG support

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWide = constraints.maxWidth > 600;

        return Scaffold(
          backgroundColor: const Color.fromRGBO(16, 20, 28, 1),
          body: Stack(
            children: [
              // Main content
              Center(
                child: Container(
                  padding: EdgeInsets.all(isWide ? 32.0 : 16.0),
                  width: isWide ? 400 : double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      GradientText(
                        'Create Account',
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
                      const SizedBox(height: 16),
                      _buildTextField('Confirm Password', obscureText: true),
                      const SizedBox(height: 24),
                      GradientButton(
                        text: 'Sign Up',
                        onPressed: () {
                          print("Sign Up button clicked...");
                        },
                      ),
                      const SizedBox(height: 20),
                      // "Already have an account?" text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account? ",
                            style: TextStyle(color: Colors.white70),
                          ),
                          InkWell(
                            onTap: () {
                              print("Navigating to Sign In screen...");
                              Navigator.pushNamed(context, AppRoutes.signInScreen);
                            },
                            child: GradientText(
                              'Sign In',
                              style: const TextStyle(fontSize: 16),
                              colors: [
                                Color.fromRGBO(127, 219, 255, 1),
                                Color.fromRGBO(66, 126, 235, 1),
                                Color.fromRGBO(78, 74, 242, 1),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Solid separator line
                      Container(
                        height: 1,
                        color: Colors.white70,
                      ),
                      const SizedBox(height: 20),
                      // Sign-Up options (Google & Apple) - Stacked vertically with 5px gap
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              print("Google Sign-Up clicked...");
                            },
                            child: SvgPicture.asset(
                              'lib/assets/google_sign_up.svg', // Path to Google sign-up button
                              height: 48, // Adjust as needed
                            ),
                          ),
                          const SizedBox(height: 8), // 5px spacing
                          InkWell(
                            onTap: () {
                              print("Apple Sign-Up clicked...");
                            },
                            child: SvgPicture.asset(
                              'lib/assets/apple_sign_up.svg', // Path to Apple sign-up button
                              height: 48, // Adjust as needed
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Orbit logo positioned at the top left
              Positioned(
                top: 16,
                left: 16,
                child: Image.asset(
                  'lib/assets/named_branding.png', // Using the PNG version of the Orbit logo
                  height: 40, // Adjust as needed
                ),
              ),
            ],
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