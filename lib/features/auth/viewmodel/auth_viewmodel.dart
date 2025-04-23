import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

part 'sign_in_state.dart';

class AuthViewModel extends ChangeNotifier {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  SignInState _state = SignInInitial();
  SignInState get state => _state;

  // Error control variables
  bool _isErrorState = false;
  bool _isProcessing = false;
  DateTime? _lastErrorTime;

  User? get currentUser => _auth.currentUser;
  bool get isLoggedIn => currentUser != null;
  bool get isEmailVerified => currentUser?.emailVerified ?? false;

  AuthViewModel({
    FirebaseAuth? auth,
    GoogleSignIn? googleSignIn,
  })  : _auth = auth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  // ------------------------
  // 1. Core Auth Operations
  // ------------------------
  Future<void> reloadUser() async {
    await currentUser?.reload();
    notifyListeners();
  }

  Future<void> signOut() async {
    await Future.wait([
      _auth.signOut(),
      _googleSignIn.signOut(),
    ]);
    _resetErrorState();
    _updateState(SignInInitial());
  }

  // ------------------------
  // 2. Email/Password Auth
  // ------------------------
  Future<void> signInWithEmail(String email, String password) async {
    if (_isProcessing) return;
    _isProcessing = true;

    try {
      _updateState(SignInLoading());

      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      if (!(userCredential.user?.emailVerified ?? true)) {
        _updateState(SignInError('Please verify your email first'));
        await signOut();
        return;
      }

      _resetErrorState();
      _updateState(SignInSuccess());
    } on FirebaseAuthException catch (e) {
      _handleAuthError(e);
      if (e.code == 'too-many-requests') {
        await Future.delayed(const Duration(seconds: 2));
      }
    } catch (e) {
      _handleGenericError('Authentication failed');
    } finally {
      _isProcessing = false;
    }
  }

  Future<void> signUpWithEmail(String email, String password) async {
    if (_isProcessing) return;
    _isProcessing = true;

    try {
      if (password.length < 8) {
        throw FirebaseAuthException(
          code: 'weak-password',
          message: 'Password must be at least 8 characters',
        );
      }

      _updateState(SignInLoading());
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      await _sendEmailVerification();
      _resetErrorState();
      _updateState(SignInSuccess(isNewUser: true));
    } on FirebaseAuthException catch (e) {
      _handleAuthError(e);
    } catch (e) {
      _handleGenericError('Registration failed');
    } finally {
      _isProcessing = false;
    }
  }

  Future<void> _sendEmailVerification() async {
    await currentUser?.sendEmailVerification();
    await reloadUser();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: _getFriendlyAuthError(e),
      );
    }
  }

  // -----------------
  // 3. Google Sign-In/Up
  // -----------------
  Future<void> signInWithGoogle() async {
    if (_isProcessing) return;
    _isProcessing = true;

    try {
      if (await _googleSignIn.isSignedIn()) {
        await _googleSignIn.disconnect();
      }

      _updateState(SignInLoading());

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        _updateState(SignInInitial());
        return;
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
      _resetErrorState();
      _updateState(SignInSuccess());
    } on FirebaseAuthException catch (e) {
      _handleAuthError(e);
    } catch (e) {
      _handleGenericError('Google sign-in failed');
    } finally {
      _isProcessing = false;
    }
  }

  // ----------------
  // 4. Apple Sign-In/Up
  // ----------------
  Future<void> signInWithApple() async {
    if (_isProcessing) return;
    _isProcessing = true;

    try {
      _updateState(SignInLoading());

      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [AppleIDAuthorizationScopes.email],
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      final userCredential =
          await _auth.signInWithCredential(oauthCredential);

      if (appleCredential.givenName != null) {
        final displayName =
            '${appleCredential.givenName} ${appleCredential.familyName ?? ''}'
                .trim();
        if (displayName.isNotEmpty) {
          await userCredential.user?.updateDisplayName(displayName);
        }
      }

      _resetErrorState();
      _updateState(SignInSuccess());
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code != AuthorizationErrorCode.canceled) {
        _handleGenericError('Apple sign-in failed');
      } else {
        _updateState(SignInInitial());
      }
    } on FirebaseAuthException catch (e) {
      _handleAuthError(e);
    } catch (e) {
      _handleGenericError('Apple sign-in failed');
    } finally {
      _isProcessing = false;
    }
  }

  // ----------------------
  // Helper Methods
  // ----------------------
  void _updateState(SignInState newState) {
    if (_state.runtimeType == newState.runtimeType &&
        (_state is SignInError && newState is SignInError)) {
      // Prevent repeating the same error state
      return;
    }
    _state = newState;
    notifyListeners();
  }

  void _resetErrorState() {
    _isErrorState = false;
    _lastErrorTime = null;
  }

  void _handleAuthError(FirebaseAuthException e) {
    final now = DateTime.now();
    if (!_isErrorState || _lastErrorTime == null || now.difference(_lastErrorTime!).inSeconds > 3) {
      _isErrorState = true;
      _lastErrorTime = now;
      _updateState(SignInError(_getFriendlyAuthError(e)));
      Future.delayed(const Duration(seconds: 5), () {
        _isErrorState = false;
      });
    }
  }

  void _handleGenericError(String message) {
    final now = DateTime.now();
    if (!_isErrorState || _lastErrorTime == null || now.difference(_lastErrorTime!).inSeconds > 3) {
      _isErrorState = true;
      _lastErrorTime = now;
      _updateState(SignInError(message));
      Future.delayed(const Duration(seconds: 5), () {
        _isErrorState = false;
      });
    }
  }

  String _getFriendlyAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No account found for this email';
      case 'wrong-password':
        return 'Incorrect password';
      case 'invalid-email':
        return 'Invalid email address';
      case 'user-disabled':
        return 'This account has been disabled';
      case 'too-many-requests':
        return 'Too many attempts. Try again later';
      case 'email-already-in-use':
        return 'This email is already registered';
      case 'operation-not-allowed':
        return 'Sign-in method not enabled';
      case 'account-exists-with-different-credential':
        return 'Account already exists with different method';
      case 'network-request-failed':
        return 'Network error occurred';
      case 'requires-recent-login':
        return 'Please sign in again';
      case 'weak-password':
        return 'Password must be at least 8 characters';
      default:
        return e.message ?? 'Authentication failed';
    }
  }
}
