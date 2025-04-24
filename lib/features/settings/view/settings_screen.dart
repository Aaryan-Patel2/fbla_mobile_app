// view/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../settings/viewmodel/settings_viewmodel.dart';
import '../widgets/settings_text_field.dart';
import '../../auth/widgets/gradient_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingsViewModel>(
      create: (_) => SettingsViewModel()..loadSettings(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: Consumer<SettingsViewModel>(
          builder: (context, viewModel, _) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      await viewModel.pickImage();
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          viewModel.profileImage != null ? FileImage(viewModel.profileImage!) : null,
                      child: viewModel.profileImage == null ? const Icon(Icons.add_a_photo) : null,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SettingsTextField(
                    label: "Display Name",
                    controller: viewModel.nameController,
                  ),
                  const SizedBox(height: 16),
                  SettingsTextField(
                    label: "Age",
                    controller: viewModel.ageController,
                    inputType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  GradientButton(
                    text: 'Save Changes',
                    onPressed: () async {
                      await viewModel.saveSettings();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Settings saved successfully!')),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  GradientButton(
                    text: 'Sign Out',
                    onPressed: () async {
                      await viewModel.signOut();
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
