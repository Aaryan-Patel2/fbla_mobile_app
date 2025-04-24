import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/home_viewmodel.dart';
import '../widgets/background_gradient.dart';
import '../widgets/home_buttons.dart'; // <-- Import HomeButton widget

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
              top: 620,
              svgAssetPath: 'assets/bugs_tab.svg',
              onTap: () {
                debugPrint('Bug Report button working!');
              },
            ),
            HomeButton(
              left: 222,
              top: 321,
              svgAssetPath: 'assets/settings_tab.svg',
              onTap: () {
                debugPrint('Settings button working!');
              },
            ),
            HomeButton(
              left: 222,
              top: 620,
              svgAssetPath: 'assets/pr_tab.svg',
              onTap: () {
                debugPrint('PR button working!');
              },
            ),
            HomeButton(
              left: 18,
              top: 321,
              svgAssetPath: 'assets/ai_tab.svg',
              onTap: () {
                debugPrint('AI button working!');
              },
            ),
            HomeButton(
              left: MediaQuery.of(context).size.width / 2 - 24, // Assuming button width is 48
              top: 150,
              svgAssetPath: 'assets/game_portal.svg',
              onTap: () {
                debugPrint('Game Portal button working!');
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
