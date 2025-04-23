import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeButton extends StatelessWidget {
  final double left;
  final double top;
  final String svgAssetPath;
  final VoidCallback? onTap;
  final double size;

  const HomeButton({
    super.key,
    required this.left,
    required this.top,
    required this.svgAssetPath,
    this.onTap,
    this.size = 60.0,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: GestureDetector(
        onTap: onTap,
        child: SvgPicture.asset(
          svgAssetPath,
          width: size,
          height: size,
        ),
      ),
    );
  }
}
