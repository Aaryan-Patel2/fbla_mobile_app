// utils/image_utils.dart
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageUtils {
  static Future<File?> pickImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    return pickedFile != null ? File(pickedFile.path) : null;
  }
}
