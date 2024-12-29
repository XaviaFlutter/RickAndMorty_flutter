// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/extension/locale_extension.dart';
import 'package:rick_and_morty/core/extension/media_query_extension.dart';

import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/core/theme/png_icon_assets.dart';
import 'package:rick_and_morty/modules/main/presentation/widgets/main_bottom_navigation_items.dart';
import 'package:rick_and_morty/modules/settings/presentation/providers/theme_provider.dart';

class MainBottomNavigation extends StatelessWidget {
  const MainBottomNavigation({
    super.key,
    required this.activeIndex,
  });
  final ValueNotifier<int> activeIndex;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: activeIndex,
      builder: (BuildContext context, dynamic value, Widget? child) {
        return Consumer<ThemeProvider>(
          builder: (context, provider, _) => Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        end: Alignment.topCenter,
                        begin: Alignment.bottomCenter,
                        colors: [
                      Colors.black.withValues(alpha: 0.5),
                      Colors.black.withValues(alpha: 0)
                    ])),
                width: double.infinity,
                height: context.screenHeight * 0.1,
              ),
              Container(
                color: provider.getThemeValue(
                    darkValue: AppColors.secondaryDark,
                    lightValue: AppColors.secondaryLight),
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MainBottomNavigationItems(
                        onTap: () => activeIndex.value = 0,
                        isActive: value == 0,
                        icon: PngIconAssets.characterPng,
                        label: context.lang.bottomNavigationCharacters),
                    MainBottomNavigationItems(
                        onTap: () => activeIndex.value = 1,
                        isActive: value == 1,
                        icon: PngIconAssets.locationsPng,
                        label: context.lang.bottomNavigationLocations),
                    MainBottomNavigationItems(
                        onTap: () => activeIndex.value = 2,
                        isActive: value == 2,
                        icon: PngIconAssets.episodePng,
                        label: context.lang.bottomNavigationEpisodes),
                    MainBottomNavigationItems(
                        onTap: () => activeIndex.value = 3,
                        isActive: value == 3,
                        icon: PngIconAssets.settingsPng,
                        label: context.lang.bottomNavigationSettings)
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
