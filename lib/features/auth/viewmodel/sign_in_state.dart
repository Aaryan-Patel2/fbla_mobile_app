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
  final bool needsVerification;
  const SignInSuccess({this.needsVerification = false});
}

class SignInError extends SignInState {
  final String message;
  const SignInError(this.message);
}