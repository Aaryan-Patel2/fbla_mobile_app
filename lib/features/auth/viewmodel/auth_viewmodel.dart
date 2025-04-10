import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

part 'sign_in_state.dart';

class AuthViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  
  SignInState _state = SignInInitial();
  SignInState get state => _state;

  User? get currentUser => _auth.currentUser;
  bool get isLoggedIn => currentUser != null;

  // ------------------------
  // 1. Email/Password Auth
  // ------------------------
  Future<void> signInWithEmail(String email, String password) async {
    try {
      _updateState(SignInLoading());
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _updateState(SignInSuccess());
    } on FirebaseAuthException catch (e) {
      _updateState(SignInError(_getFriendlyAuthError(e)));
    } catch (e) {
      _updateState(SignInError('Unknown error occurred'));
    }
  }

  Future<void> signUpWithEmail(String email, String password) async {
    try {
      _updateState(SignInLoading());
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await _sendEmailVerification();
      _updateState(SignInSuccess(needsVerification: true));
    } on FirebaseAuthException catch (e) {
      _updateState(SignInError(_getFriendlyAuthError(e)));
    }
  }

  Future<void> _sendEmailVerification() async {
    await currentUser?.sendEmailVerification();
  }

  // -----------------
  // 2. Google Sign-In
  // -----------------
  Future<void> signInWithGoogle() async {
    try {
      _updateState(SignInLoading());
      
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        _updateState(SignInInitial()); // User cancelled flow
        return;
      }

      final GoogleSignInAuthentication googleAuth = 
          await googleUser.authentication;
      
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
      _updateState(SignInSuccess());
    } on FirebaseAuthException catch (e) {
      _updateState(SignInError(_getFriendlyAuthError(e)));
    } catch (e) {
      _updateState(SignInError('Google sign-in failed'));
    }
  }

  // ----------------
  // 3. Apple Sign-In
  // ----------------
  Future<void> signInWithApple() async {
    try {
      _updateState(SignInLoading());
      
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      await _auth.signInWithCredential(oauthCredential);
      _updateState(SignInSuccess());
    } on FirebaseAuthException catch (e) {
      _updateState(SignInError(_getFriendlyAuthError(e)));
    } catch (e) {
      _updateState(SignInError('Apple sign-in failed'));
    }
  }

  // -------------------
  // 4. Password Recovery
  // -------------------
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: _getFriendlyAuthError(e));
    }
  }

  // ---------------
  // 5. Sign Out
  // ---------------
  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    _updateState(SignInInitial());
  }

  // ----------------------
  // Helper Methods
  // ----------------------
  void _updateState(SignInState newState) {
    _state = newState;
    notifyListeners();
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
      default:
        return e.message ?? 'Authentication failed';
    }
  }
}