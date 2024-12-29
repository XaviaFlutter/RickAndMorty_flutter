import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';

class LetterTextApp extends StatelessWidget {
  const LetterTextApp({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: const TextStyle(
          color: AppColors.darkSecondaryText,
          fontWeight: FontWeight.w500,
          fontSize: 10,
          letterSpacing: 1.5),
    );
  }
}
