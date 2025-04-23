part of 'auth_viewmodel.dart';

abstract class SignInState {
  const SignInState();
}

class SignInInitial extends SignInState {
  const SignInInitial();
}

class SignInLoading extends SignInState {
  const SignInLoading();
}

class SignInSuccess extends SignInState {
  final bool isNewUser;
  final User? user;
  const SignInSuccess({
    this.isNewUser = false,
    this.user,
  });
}

class SignInNeedsVerification extends SignInState {
  final String email;
  const SignInNeedsVerification(this.email);
}

enum AuthErrorType { network, invalidCredentials, emailExists, unknown }

class SignInError extends SignInState {
  final String message;
  final AuthErrorType type;
  const SignInError(
    this.message, {
    this.type = AuthErrorType.unknown,
  });
}

class PasswordResetSent extends SignInState {
  final String email;
  const PasswordResetSent(this.email);
}