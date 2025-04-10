import 'package:flutter/material.dart';
import 'package:fbla_mobile_app/features/auth/widgets/auth_header.dart';
import 'package:fbla_mobile_app/features/auth/widgets/auth_text_field.dart';
import 'package:fbla_mobile_app/features/auth/widgets/gradient_button.dart';
import 'package:fbla_mobile_app/features/auth/widgets/social_auth_button.dart';
import 'package:fbla_mobile_app/features/auth/widgets/auth_toggle_text.dart';
import 'package:fbla_mobile_app/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 20, 28, 1),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const AuthHeader(title: 'Create Account'),
              const SizedBox(height: 24),
              AuthTextField(
                hint: 'Email',
                controller: _emailController,
              ),
              const SizedBox(height: 16),
              AuthTextField(
                hint: 'Password',
                controller: _passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 16),
              AuthTextField(
                hint: 'Confirm Password',
                controller: _confirmPasswordController,
                obscureText: true,
              ),
              const SizedBox(height: 24),
              GradientButton(
                text: 'Sign Up',
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              const Divider(color: Colors.white70),
              const SizedBox(height: 20),
              Column(
                children: [
                  SocialAuthButton(
                    assetPath: 'assets/google_sign_up.svg',
                    onPressed: () => _handleGoogleSignUp(context),
                  ),
                  const SizedBox(height: 8),
                  SocialAuthButton(
                    assetPath: 'assets/apple_sign_up.svg',
                    onPressed: () => _handleAppleSignUp(context),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              AuthToggleText(
                prefixText: "Already have an account? ",
                actionText: 'Sign in',
                onTap: () => Navigator.pushNamed(context, '/signin'),
              ),
            ],
          ),
        ),
      ),
    );
  }

void _handleGoogleSignUp(BuildContext context) {
    context.read<AuthViewModel>().signInWithGoogle();
  }

void _handleAppleSignUp(BuildContext context) {
    context.read<AuthViewModel>().signInWithApple();
  }
}