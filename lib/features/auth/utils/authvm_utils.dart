import 'package:flutter/material.dart';
import 'package:fbla_mobile_app/features/auth/viewmodel/auth_viewmodel.dart';

// ----------------------------
// 1. Auth State Handlers
// ----------------------------
void handleAuthState({
  required SignInState state,
  required BuildContext context,
  required VoidCallback onSuccess,
  required Function(bool) setGoogleLoading,
  required Function(bool) setAppleLoading,
}) {
  if (state is SignInSuccess) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state.isNewUser) {
        showVerificationDialog(context);
      } else {
        onSuccess();
      }
    });
  } else if (state is SignInError) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
      );
      setGoogleLoading(false);
      setAppleLoading(false);
    });
  }
}

void showVerificationDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: const Text('Verify Your Email'),
      content: const Text(
        'A verification link has been sent to your email. '
        'Please verify your email before signing in.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}

// ----------------------------
// 2. Form Validators
// ----------------------------
String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    return 'Enter a valid email address';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password';
  }
  if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }
  return null;
}

String? validateConfirmPassword(String? value, String password) {
  if (value != password) {
    return 'Passwords do not match';
  }
  return null;
}

// ----------------------------
// 3. Social Auth Handlers
// ----------------------------
Future<void> handleSocialAuth({
  required BuildContext context,
  required String provider,
  required Future<void> Function() authFunction,
  required Function(bool) setLoadingState,
}) async {
  try {
    setLoadingState(true);
    await authFunction();
  } finally {
    if (context.mounted) {
      setLoadingState(false);
    }
  }
}