// widgets/settings_text_field.dart
import 'package:flutter/material.dart';

class SettingsTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType inputType;

  const SettingsTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}
