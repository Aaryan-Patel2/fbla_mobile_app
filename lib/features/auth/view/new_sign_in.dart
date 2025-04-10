import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fbla_mobile_app/features/auth/widgets/auth_header.dart';
import 'package:fbla_mobile_app/features/auth/widgets/auth_text_field.dart';
import 'package:fbla_mobile_app/features/auth/widgets/gradient_button.dart';
import 'package:fbla_mobile_app/features/auth/widgets/social_auth_button.dart';
import 'package:fbla_mobile_app/features/auth/widgets/auth_toggle_text.dart';
import 'package:fbla_mobile_app/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:fbla_mobile_app/features/auth/utils/authvm_utils.dart';

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
                    SocialAuthButton(
                      assetPath: 'assets/google_sign_in.svg',
                      onPressed: () => _handleSocialAuth(
                        context: context,
                        provider: 'google',
                        authFunction: () => context.read<AuthViewModel>().signInWithGoogle(),
                        setLoadingState: (value) => setState(() => _isGoogleSigningIn = value),
                      ),
                      isLoading: _isGoogleSigningIn,
                    ),
                    const SizedBox(height: 8),
                    SocialAuthButton(
                      assetPath: 'assets/apple_sign_in.svg',
                      onPressed: () => _handleSocialAuth(
                        context: context,
                        provider: 'apple',
                        authFunction: () => context.read<AuthViewModel>().signInWithApple(),
                        setLoadingState: (value) => setState(() => _isAppleSigningIn = value),
                      ),
                      isLoading: _isAppleSigningIn,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                AuthToggleText(
                  prefixText: "Don't have an account? ",
                  actionText: 'Sign up',
                  onTap: () => Navigator.pushNamed(context, '/signup'),
                ),
              ],
            ),
          ),
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
    await handleSocialAuth(
      context: context,
      provider: provider,
      authFunction: authFunction,
      setLoadingState: setLoadingState,
    );
  }
}