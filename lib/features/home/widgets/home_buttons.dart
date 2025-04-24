import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeButton extends StatelessWidget {
  final double left;
  final double top;
  final String svgAssetPath;
  final VoidCallback? onTap;
  final double scale; // instead of size

  const HomeButton({
    super.key,
    required this.left,
    required this.top,
    required this.svgAssetPath,
    this.onTap,
    this.scale = 1.5,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: GestureDetector(
        onTap: onTap,
        child: Transform.scale(
          scale: scale,
          child: SvgPicture.asset(svgAssetPath),
        ),
      ),
    );
  }
}
