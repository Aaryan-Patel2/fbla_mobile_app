import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _displayName;

  String? get displayName => _displayName;

  HomeViewModel() {
    _loadDisplayName();
  }

  Future<void> _loadDisplayName() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.displayName != null && user.displayName!.trim().isNotEmpty) {
        _displayName = user.displayName!.split(" ").first;
      } else {
        _displayName = user.email;
      }
    } else {
      _displayName = 'Guest';
    }
    notifyListeners();
  }
}