import 'package:flutter/material.dart';

class BugReportTextField extends StatelessWidget {
  final TextEditingController controller;

  const BugReportTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 10,
      maxLength: 4000,
      style: const TextStyle(
        color: Colors.black, // 👈 This makes the text black
      ),
      decoration: InputDecoration(
        hintText: 'Describe the issue you faced...',
        hintStyle: const TextStyle(color: Colors.black54), // Optional: style the hint
        filled: true,
        fillColor: Colors.white, // Ensures contrast
        border: const OutlineInputBorder(),
      ),
    );
  }
}

