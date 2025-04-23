import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fbla_mobile_app/features/auth/widgets/auth_header.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fbla_mobile_app/features/auth/widgets/auth_text_field.dart';
import 'package:fbla_mobile_app/features/auth/widgets/gradient_button.dart';
import 'package:fbla_mobile_app/features/auth/widgets/auth_toggle_text.dart';
import 'package:fbla_mobile_app/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:fbla_mobile_app/core/routes/app_routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isGoogleSigningUp = false;
  bool _isAppleSigningUp = false;
  bool _isSnackBarVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
                onPressed: _submitForm,
              ),
              const SizedBox(height: 20),
              const Divider(color: Colors.white70),
              const SizedBox(height: 20),
              Column(
                children: [
                  _buildSocialButton(
                    context,
                    Buttons.google,
                    _isGoogleSigningUp,
                    'Google',
                    () => _handleGoogleSignUp(context),
                    (value) => setState(() => _isGoogleSigningUp = value),
                  ),
                  const SizedBox(height: 8),
                  _buildSocialButton(
                    context,
                    Buttons.apple,
                    _isAppleSigningUp,
                    'Apple',
                    () => _handleAppleSignUp(context),
                    (value) => setState(() => _isAppleSigningUp = value),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              AuthToggleText(
                prefixText: "Already have an account? ",
                actionText: 'Sign in',
                onTap: () => Navigator.pushNamed(context, AppRoutes.testSignInScreen),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(
    BuildContext context,
    Buttons button,
    bool isLoading,
    String provider,
    Future<void> Function() authFunction,
    Function(bool) setLoadingState,
  ) {
    return SizedBox(
      width: double.infinity,
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SignInButton(
              button,
              text: 'Continue with $provider',
              onPressed: () => _handleSocialAuth(
                context: context,
                provider: provider,
                authFunction: authFunction,
                setLoadingState: setLoadingState,
              ),
            ),
    );
  }

  Future<void> _submitForm() async {
    try {
      if (_passwordController.text.length < 8) {
        throw Exception('Password must be at least 8 characters');
      }
      
      if (_passwordController.text != _confirmPasswordController.text) {
        throw Exception('Passwords do not match');
      }

      await context.read<AuthViewModel>().signUpWithEmail(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
      
      // If successful, the AuthViewModel will handle navigation
    } catch (e) {
      _showErrorSnackbar(context, 'Sign up failed: ${e.toString()}');
    }
  }

  Future<void> _handleSocialAuth({
    required BuildContext context,
    required String provider,
    required Future<void> Function() authFunction,
    required Function(bool) setLoadingState,
  }) async {
    if (_isSnackBarVisible) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    }

    setLoadingState(true);
    try {
      await authFunction();
      
      // Check if this is a new user
      final authVM = context.read<AuthViewModel>();
      final user = authVM.currentUser;
      if (user != null && user.metadata.creationTime == user.metadata.lastSignInTime) {
        // This is a new user via social sign-up
        _handleNewSocialUser(user, provider);
      }
    } catch (e) {
      _showErrorSnackbar(context, '$provider sign up failed: ${e.toString()}');
    } finally {
      if (mounted) {
        setLoadingState(false);
      }
    }
  }

  void _handleNewSocialUser(User user, String provider) {
    // You can add specific onboarding for new social users here
    // For example:
    // - Collect additional profile information
    // - Show welcome tutorial
    // - Set initial preferences
    
    debugPrint('New $provider user created: ${user.uid}');
    
    // The AuthViewModel's state changes will handle navigation
    // but you could add specific new user logic here if needed
  }

  void _showErrorSnackbar(BuildContext context, String message) {
    if (mounted) {
      _isSnackBarVisible = true;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 4),
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
            label: 'OK',
            textColor: Colors.white,
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ),
      ).closed.then((_) {
        if (mounted) {
          setState(() => _isSnackBarVisible = false);
        }
      });
    }
  }

  Future<void> _handleGoogleSignUp(BuildContext context) async {
    await _handleSocialAuth(
      context: context,
      provider: 'Google',
      authFunction: () => context.read<AuthViewModel>().signInWithGoogle(),
      setLoadingState: (value) => setState(() => _isGoogleSigningUp = value),
    );
  }

  Future<void> _handleAppleSignUp(BuildContext context) async {
    await _handleSocialAuth(
      context: context,
      provider: 'Apple',
      authFunction: () => context.read<AuthViewModel>().signInWithApple(),
      setLoadingState: (value) => setState(() => _isAppleSigningUp = value),
    );
  }
}