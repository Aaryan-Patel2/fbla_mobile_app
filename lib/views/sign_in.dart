import 'package:flutter/material.dart';
import 'package:fbla_mobile_app/widgets/buttons.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fbla_mobile_app/routes/app_routes.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    if (_emailController.text == "orbit.test@gmail.com" &&
        _passwordController.text == "test123") {
      Navigator.pushNamed(context, AppRoutes.homeScreen);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid email or password")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWide = constraints.maxWidth > 600;

        return Scaffold(
          backgroundColor: const Color.fromRGBO(16, 20, 28, 1),
          body: Stack(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(isWide ? 32.0 : 16.0),
                  width: isWide ? 400 : double.infinity,
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
                      _buildTextField('Email', controller: _emailController),
                      const SizedBox(height: 16),
                      _buildTextField('Password', controller: _passwordController, obscureText: true),
                      const SizedBox(height: 20),
                      GradientButton(
                        text: 'Login',
                        onPressed: _handleLogin,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(color: Colors.white70),
                          ),
                          InkWell(
                            onTap: () {
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
                      const SizedBox(height: 20),
                      Container(height: 1, color: Colors.white70),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'lib/assets/google_sign_in.svg',
                              height: 48,
                            ),
                          ),
                          const SizedBox(height: 5),
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'lib/assets/apple_sign_in.svg',
                              height: 48,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 16,
                left: 16,
                child: Image.asset(
                  'lib/assets/named_branding.png',
                  height: 40,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTextField(String hint, {bool obscureText = false, TextEditingController? controller}) {
    return TextField(
      controller: controller,
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
