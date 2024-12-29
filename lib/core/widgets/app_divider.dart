import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';

class AppDivider extends StatelessWidget {
  final double thickness;
  const AppDivider({super.key, this.thickness = 1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Container(
        height: thickness,
        width: double.infinity,
        color: AppColors.secondaryDark,
        margin: const EdgeInsets.symmetric(vertical: 8),
      ),
    );
  }
}
