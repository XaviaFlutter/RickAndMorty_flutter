import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/core/theme/images_assets.dart';

class NotFoundCharacters extends StatelessWidget {
  const NotFoundCharacters({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            height: 300,
            width: 300,
            child: Image.asset(ImagesAssetsApp.mortySearchError)),
        const Text(
          'Персонаж с таким именем\n не найден',
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.darkSecondaryText),
        ),
      ],
    );
  }
}
