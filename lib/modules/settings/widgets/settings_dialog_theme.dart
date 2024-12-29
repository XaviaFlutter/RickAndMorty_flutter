import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/extension/locale_extension.dart';
import 'package:rick_and_morty/core/extension/media_query_extension.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/modules/settings/presentation/providers/theme_provider.dart';

class SeetingsDialogTheme extends StatelessWidget {
  const SeetingsDialogTheme({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Consumer<ThemeProvider>(
        builder: (context, provider, _) => Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            width: double.infinity,
            height: context.screenHeight * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  context.lang.settingsFunctionAppearance,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Radio<AppThemeMode>(
                        value: AppThemeMode.light,
                        groupValue: provider.currentTheme,
                        onChanged: (AppThemeMode? value) {
                          if (value != null) {
                            provider.setTheme(value);
                          }
                        }),
                    Text(
                      context.lang.settingsFunctionOff,
                      style: const TextStyle(),
                    )
                  ],
                ),
                Row(
                  children: [
                    Radio<AppThemeMode>(
                        value: AppThemeMode.dark,
                        groupValue: provider.currentTheme,
                        onChanged: (AppThemeMode? value) {
                          if (value != null) {
                            provider.setTheme(value);
                          }
                        }),
                    Text(
                      context.lang.settingsFunctionOn,
                    )
                  ],
                ),
                Row(
                  children: [
                    Radio<AppThemeMode>(
                        value: AppThemeMode.systemTheme,
                        groupValue: provider.currentTheme,
                        onChanged: (AppThemeMode? value) {
                          if (value != null) {
                            provider.setTheme(value);
                          }
                        }),
                    Text(
                      context.lang.settingsFunctionSystem,
                    )
                  ],
                ),
                Row(
                  children: [
                    Radio<AppThemeMode>(
                        value: AppThemeMode.battery,
                        groupValue: provider.currentTheme,
                        onChanged: (AppThemeMode? value) {
                          if (value != null) {
                            provider.setTheme(value);
                          }
                        }),
                    Text(
                      context.lang.settingsFunctionEnergySaving,
                    )
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    const Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          style: TextStyle(
                              letterSpacing: 1.5,
                              fontSize: 14,
                              color:
                                  provider.materialThemeMode == ThemeMode.dark
                                      ? AppColors.darkMainText
                                      : AppColors.mainDark),
                          context.lang.settingsFunctionCancel.toUpperCase(),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
