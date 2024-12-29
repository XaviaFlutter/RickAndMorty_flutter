import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty/modules/settings/presentation/providers/theme_provider.dart';

class AppBarDefaultSettings extends StatelessWidget {
  const AppBarDefaultSettings({super.key, required this.title, this.onTap});
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final providerTheme = context.watch<ThemeProvider>().materialThemeMode;
    return Row(
      children: [
        IconButton(
            onPressed: onTap ??
                () {
                  context.router.maybePop();
                },
            icon: Icon(
              color: providerTheme == ThemeMode.dark
                  ? AppColors.darkMainText
                  : AppColors.mainDark,
              Icons.keyboard_backspace,
            )),
        const SizedBox(
          width: 20,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
