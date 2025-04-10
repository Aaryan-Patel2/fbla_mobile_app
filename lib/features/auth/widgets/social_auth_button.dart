import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialAuthButton extends StatelessWidget {
  final String assetPath;
  final VoidCallback onPressed;
  final double height;
  final bool isLoading; // ✅ Add this

  const SocialAuthButton({
    super.key,
    required this.assetPath,
    required this.onPressed,
    this.height = 48,
    this.isLoading = false, 
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: isLoading ? null : onPressed, 
      child: Container(
        height: height + 16, //
        width: height + 16,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(8),
        ),
        child: isLoading
            ? const Center(
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                ),
              )
            : SvgPicture.asset(
                assetPath,
                height: height,
              ),
      ),
    );
  }
}