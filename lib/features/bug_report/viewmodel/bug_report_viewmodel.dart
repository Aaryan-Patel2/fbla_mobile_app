import 'package:flutter/material.dart';
import '../utils/bug_report_utils.dart';

class BugReportViewModel extends ChangeNotifier {
  final TextEditingController controller = TextEditingController();

  Future<void> saveDraft() async {
    await BugReportUtils.saveDraft(controller.text);
  }

  Future<void> loadDraft() async {
    final draft = await BugReportUtils.loadDraft();
    controller.text = draft ?? '';
    notifyListeners();
  }

  Future<void> clearDraft() async {
    await BugReportUtils.clearDraft();
    controller.clear();
    notifyListeners();
  }
}
