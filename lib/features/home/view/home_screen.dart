import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/home_viewmodel.dart';
import '../widgets/background_gradient.dart';
import '../widgets/home_buttons.dart'; // <-- Import HomeButton widget
import '../../../core/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: Scaffold(
        body: Stack(
          children: [
            const BackgroundGradient(),

            // HomeButtons placed at various coordinates
            HomeButton(
              left: 18,
              top: 550,
              svgAssetPath: 'assets/bugs_tab.svg',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.testBugReportsScreen);
              },
            ),
            HomeButton(
              left: 215,
              top: 310,
              svgAssetPath: 'assets/settings_tab.svg',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.testSettingsScreen);
              },
            ),
            HomeButton(
              left: 215,
              top: 530,
              svgAssetPath: 'assets/pr_tab.svg',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.personalRecordScreen);
              },
            ),
            HomeButton(
              left: 18,
              top: 321,
              svgAssetPath: 'assets/ai_tab.svg',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.chatScreen);
              },
            ),
            HomeButton(
              left: 60,
              top: 50,
              svgAssetPath: 'assets/game_portal.svg',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.subjectSelectionScreen);
              },
            ),

            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Consumer<HomeViewModel>(
                  builder: (context, viewModel, _) {
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Welcome ${viewModel.displayName ?? ''}',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
