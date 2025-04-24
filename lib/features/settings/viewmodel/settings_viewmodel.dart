// viewmodel/settings_view_model.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../utils/image_utils.dart';

class SettingsViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late TextEditingController nameController;
  late TextEditingController ageController;
  File? profileImage;

  SettingsViewModel() {
    nameController = TextEditingController();
    ageController = TextEditingController();
  }

  void loadSettings() {
    // Load current user info, this would be from Firestore or any other source
    final user = _auth.currentUser;
    if (user != null) {
      nameController.text = user.displayName ?? '';
      ageController.text = user.metadata.creationTime?.toLocal().toString() ?? ''; // Example for age
    }
  }

  Future<void> pickImage() async {
    profileImage = await ImageUtils.pickImage();
    notifyListeners();
  }

  Future<void> saveSettings() async {
    try {
      // Save the user data logic, e.g., to Firestore and Firebase Storage for the image
      final user = _auth.currentUser;
      if (user != null) {
        final storageRef = FirebaseStorage.instance.ref().child('profile_pics/${user.uid}.jpg');
        if (profileImage != null) {
          await storageRef.putFile(profileImage!);
        }
        await user.updateDisplayName(nameController.text);
        // Add more save logic for age, etc.
      }
    } catch (e) {
      print("Error saving settings: $e");
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
