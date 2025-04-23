import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fbla_mobile_app/features/auth/widgets/auth_header.dart';
import 'package:fbla_mobile_app/features/auth/widgets/auth_text_field.dart';
import 'package:fbla_mobile_app/features/auth/widgets/gradient_button.dart';
import 'package:fbla_mobile_app/features/auth/widgets/auth_toggle_text.dart';
import 'package:fbla_mobile_app/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:fbla_mobile_app/features/auth/utils/authvm_utils.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:fbla_mobile_app/core/routes/app_routes.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isGoogleSigningIn = false;
  bool _isAppleSigningIn = false;
  bool _isSnackBarVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = context.watch<AuthViewModel>();

    handleAuthState(
      state: authViewModel.state,
      context: context,
      onSuccess: () => Navigator.pushReplacementNamed(context, '/home'),
      setGoogleLoading: (value) => setState(() => _isGoogleSigningIn = value),
      setAppleLoading: (value) => setState(() => _isAppleSigningIn = value),
    );

    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 20, 28, 1),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const AuthHeader(title: 'Welcome Back'),
                const SizedBox(height: 24),
                AuthTextField(
                  hint: 'Email',
                  controller: _emailController,
                  validator: (value) => validateEmail(value),
                ),
                const SizedBox(height: 16),
                AuthTextField(
                  hint: 'Password',
                  controller: _passwordController,
                  obscureText: true,
                  validator: (value) => validatePassword(value),
                ),
                const SizedBox(height: 24),
                GradientButton(
                  text: 'Sign In',
                  isLoading: authViewModel.state is SignInLoading && 
                      !_isGoogleSigningIn && 
                      !_isAppleSigningIn,
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
                      _isGoogleSigningIn,
                      'google',
                      () => _handleGoogleSignIn(context),
                      (value) => setState(() => _isGoogleSigningIn = value),
                    ),
                    const SizedBox(height: 8),
                    _buildSocialButton(
                      context,
                      Buttons.apple,
                      _isAppleSigningIn,
                      'apple',
                      () => _handleAppleSignIn(context),
                      (value) => setState(() => _isAppleSigningIn = value),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                AuthToggleText(
                  prefixText: "Don't have an account? ",
                  actionText: 'Sign up',
                  onTap: () => Navigator.pushNamed(context, AppRoutes.testSignUpScreen),
                ),
              ],
            ),
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
              text: 'Sign in with ${provider[0].toUpperCase()}${provider.substring(1)}',
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
    if (_formKey.currentState!.validate()) {
      await context.read<AuthViewModel>().signInWithEmail(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
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
    } catch (e) {
      if (mounted) {
        _isSnackBarVisible = true;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$provider sign in failed: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 4),
            behavior: SnackBarBehavior.floating,
          ),
        ).closed.then((_) {
          if (mounted) {
            setState(() => _isSnackBarVisible = false);
          }
        });
      }
    } finally {
      if (mounted) {
        setLoadingState(false);
      }
    }
  }

  Future<void> _handleGoogleSignIn(BuildContext context) async {
    await _handleSocialAuth(
      context: context,
      provider: 'google',
      authFunction: () => context.read<AuthViewModel>().signInWithGoogle(),
      setLoadingState: (value) => setState(() => _isGoogleSigningIn = value),
    );
  }

  Future<void> _handleAppleSignIn(BuildContext context) async {
    await _handleSocialAuth(
      context: context,
      provider: 'apple',
      authFunction: () => context.read<AuthViewModel>().signInWithApple(),
      setLoadingState: (value) => setState(() => _isAppleSigningIn = value),
    );
  }
}