import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import '../../home/utils/asset_utils.dart';
import '../viewmodel/personal_records_viewmodel.dart';
import '../widgets/personal_records_card.dart';

class PersonalRecordsScreen extends StatelessWidget {
  const PersonalRecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PersonalRecordsViewModel(),
      child: Consumer<PersonalRecordsViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            body: Stack(
              children: [
                SvgPicture.asset(
                  AssetUtils.backgroundGradientAsset,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Personal Records',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Screenshot(
                          controller: viewModel.screenshotController,
                          child: const PersonalRecordsCard(),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton.icon(
                              onPressed: viewModel.captureAndSave,
                              icon: const Icon(Icons.camera_alt),
                              label: const Text('Save Image'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurpleAccent,
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: viewModel.openInstagram,
                              icon: const Icon(Icons.open_in_new),
                              label: const Text('Open Instagram'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pinkAccent,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
