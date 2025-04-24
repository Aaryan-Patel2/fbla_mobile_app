import 'package:flutter/material.dart';

class BugReportSubmitButton extends StatelessWidget {
  final VoidCallback onSubmit;

  const BugReportSubmitButton({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onSubmit,
      icon: const Icon(Icons.bug_report_outlined),
      label: const Text('Submit Bug Report'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
