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
      decoration: InputDecoration(
        hintText: 'Describe the issue you faced...',
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(),
      ),
    );
  }
}
