import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/core/theme/png_icon_assets.dart';
import 'package:rick_and_morty/modules/settings/presentation/providers/theme_provider.dart';

class FunctionButtonDefault extends StatelessWidget {
  const FunctionButtonDefault(
      {super.key,
      required this.onTap,
      required this.mainText,
      required this.description,
      this.isIcon = false,
      this.isDetail = false,
      this.isFunction = true,
      this.icon});
  final VoidCallback onTap;
  final String mainText;
  final String description;
  final bool isIcon;
  final bool isDetail;
  final bool isFunction;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
    final providerTheme = context.watch<ThemeProvider>().materialThemeMode;
    return Row(
      children: [
        if (isIcon)
          SizedBox(
              height: 36, width: 36, child: icon ?? const SizedBox.shrink()),
        if (isIcon)
          const SizedBox(
            width: 16,
          ),
        isDetail
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    description,
                    style: TextStyle(
                      color: providerTheme == ThemeMode.dark
                          ? AppColors.darkSecondaryText
                          : AppColors.lightSecondaryText,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    mainText,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mainText,
                    style: TextStyle(
                      color: providerTheme == ThemeMode.dark
                          ? AppColors.darkMainText
                          : AppColors.mainDark,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      color: providerTheme == ThemeMode.dark
                          ? AppColors.darkSecondaryText
                          : AppColors.lightSecondaryText,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
        const Spacer(),
        isFunction
            ? IconButton(
                onPressed: onTap,
                icon: Icon(
                  color: providerTheme == ThemeMode.dark
                      ? AppColors.darkMainText
                      : AppColors.mainDark,
                  Icons.chevron_right,
                  size: 16,
                ))
            : const SizedBox.shrink(),
      ],
    );
  }
}
