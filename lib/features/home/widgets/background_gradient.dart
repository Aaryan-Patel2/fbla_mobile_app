import 'package:flutter/material.dart';
import '../utils/asset_utils.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -118,
      top: -71,
      child: Image.asset(
        AssetUtils.backgroundGradientAsset,
        fit: BoxFit.cover,
        width: 400, // Adjust as needed
        height: 400,
      ),
    );
  }
}