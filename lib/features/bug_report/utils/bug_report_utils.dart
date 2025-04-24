import 'package:shared_preferences/shared_preferences.dart';

class BugReportUtils {
  static const _draftKey = 'bug_report_draft';

  static Future<void> saveDraft(String text) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_draftKey, text);
  }

  static Future<String?> loadDraft() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_draftKey);
  }

  static Future<void> clearDraft() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_draftKey);
  }
}
