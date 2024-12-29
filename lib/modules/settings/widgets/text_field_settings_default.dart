import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';

class TextFieldSettingsDefault extends StatelessWidget {
  const TextFieldSettingsDefault(
      {super.key, required this.controller, required this.title});
  final TextEditingController controller;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TextField(
            controller: controller,
          ),
        ),
      ],
    );
  }
}
