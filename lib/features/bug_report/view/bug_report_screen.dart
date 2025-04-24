import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_logs/smart_logs.dart';
import '../viewmodel/bug_report_viewmodel.dart';
import '../widgets/bug_report_text_field.dart';
import '../widgets/bug_report_submit_button.dart';

class BugReportScreen extends StatefulWidget {
  const BugReportScreen({super.key});

  @override
  State<BugReportScreen> createState() => _BugReportScreenState();
}

class _BugReportScreenState extends State<BugReportScreen> {
  late BugReportViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = BugReportViewModel();
    viewModel.loadDraft();
  }

  void _submitReport() {
    SLDialog.SL_DIALOG(
      context,
      sendToEmail: 'orbitapp.reports@gmail.com',
      emailsubject: 'Bug Report from User',
    );
    viewModel.clearDraft();
  }

  Future<bool> _onWillPop() async {
    await viewModel.saveDraft();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Submit a Bug'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                BugReportTextField(controller: viewModel.controller),
                const SizedBox(height: 16),
                BugReportSubmitButton(onSubmit: _submitReport),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
