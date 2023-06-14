import 'package:flutter/material.dart';
import 'package:test_pixelfield_flutter/config/color_styles.dart';

class CommonTabIndicator extends StatelessWidget {
  final double width, height;

  const CommonTabIndicator(
      {super.key, this.width = double.infinity, this.height = 2});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.primaryGradientRev,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          tileMode: TileMode.clamp,
        ),
      ),
    );
  }
}
