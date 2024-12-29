import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/modules/settings/presentation/providers/theme_provider.dart';

class MainBottomNavigationItems extends StatelessWidget {
  const MainBottomNavigationItems(
      {super.key,
      required this.icon,
      required this.label,
      required this.isActive,
      required this.onTap});
  final String icon;
  final String label;
  final bool isActive;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, _) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 25,
                  child: Image.asset(icon,
                      color: isActive
                          ? provider.getThemeValue(
                              darkValue: AppColors.green,
                              lightValue: AppColors.blue)
                          : provider.getThemeValue(
                              darkValue: AppColors.darkSecondaryText,
                              lightValue: AppColors.lightSecondaryText))),
              Text(
                label,
                style: TextStyle(
                    color: isActive
                        ? provider.getThemeValue(
                            darkValue: AppColors.green,
                            lightValue: AppColors.blue)
                        : provider.getThemeValue(
                            darkValue: AppColors.darkSecondaryText,
                            lightValue: AppColors.lightSecondaryText),
                    fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
