import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:typed_data';
import 'package:url_launcher/url_launcher.dart';

class PersonalRecordsViewModel extends ChangeNotifier {
  final ScreenshotController screenshotController = ScreenshotController();

  Future<void> captureAndSave() async {
    try {
      final Uint8List? image = await screenshotController.capture();
      if (image != null) {
        await ImageGallerySaver.saveImage(image, quality: 90, name: "personal_records");
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
