import 'package:flutter/material.dart';
import 'package:fbla_mobile_app/widgets/buttons.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fbla_mobile_app/routes/app_routes.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWide = constraints.maxWidth > 600; // Adapt based on screen width

        return Scaffold(
          backgroundColor: const Color.fromRGBO(16, 20, 28, 1),
          body: Stack(
            children: [
              // Container for the rest of the UI elements
              Center(
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
                      const SizedBox(height: 20), // Increased gap between Login button and "Don't have an account?"
                      GradientButton(
                        text: 'Login',
                        onPressed: () {
                          print("Login button clicked...");
                        },
                      ),
                      const SizedBox(height: 20), // Increased gap between Login button and the "Don't have an account?" section
                      // Always visible, adjusts dynamically with screen size
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(color: Colors.white70),
                          ),
                          InkWell(
                            onTap: () {
                              print("Navigating to Sign Up screen...");
                              Navigator.pushNamed(context, AppRoutes.signUpScreen);
                            },
                            child: GradientText(
                              'Sign up',
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
                      const SizedBox(height: 20), // Increased gap between "Don't have an account?" and sign-in buttons
                      // Solid line separator
                      Container(
                        height: 1,
                        color: Colors.white70,
                      ),
                      const SizedBox(height: 20),
                      // Sign-in options (Google & Apple) - Stacked vertically with 20px gap
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              print("Google Sign-In clicked...");
                            },
                            child: SvgPicture.asset(
                              'lib/assets/google_sign_in.svg', // Path to Google sign-in button
                              height: 48, // Adjust as needed
                            ),
                          ),
                          const SizedBox(height: 5), // Even spacing of 20px
                          InkWell(
                            onTap: () {
                              print("Apple Sign-In clicked...");
                            },
                            child: SvgPicture.asset(
                              'lib/assets/apple_sign_in.svg', // Path to Apple sign-in button
                              height: 48, // Adjust as needed
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // App logo positioned at the top left corner (Now using PNG instead of SVG)
              Positioned(
                top: 16,
                left: 16,
                child: Image.asset(
                  'lib/assets/named_branding.png', // Updated to use the PNG version
                  height: 40, // Adjust the size as needed
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
