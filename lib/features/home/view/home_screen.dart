import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/home_viewmodel.dart';
import '../widgets/background_gradient.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: Scaffold(
        body: Stack(
          children: [
            const BackgroundGradient(), // Updated to use SvgPicture
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
                          color: Color.fromARGB(255, 255, 255, 255), // Optional: depends on your background
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
