import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:vision_gallery_saver/vision_gallery_saver.dart'; // New package
import 'dart:typed_data';
import 'package:url_launcher/url_launcher.dart';

class PersonalRecordsViewModel extends ChangeNotifier {
  final ScreenshotController screenshotController = ScreenshotController();

  Future<void> captureAndSave() async {
    try {
      final Uint8List? image = await screenshotController.capture();
      if (image != null) {
        final result = await VisionGallerySaver.saveImage(
          image,
          quality: 90,
          name: "personal_records",
          isReturnImagePathOfIOS: true, // Optional but recommended for cross-platform
          skipIfExists: false, // You can set this to true if you want to avoid overwriting
          androidRelativePath: "Pictures/PersonalRecords", // Optional: saves to a subfolder
        );

        // Optionally show result (or debug print)
        debugPrint("Save result: $result");
      }
    } catch (e) {
      debugPrint("Screenshot error: $e");
    }
  }

  void openInstagram() async {
    const url = 'https://www.instagram.com/';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }
}

