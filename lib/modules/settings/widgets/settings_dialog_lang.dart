import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/extension/locale_extension.dart';
import 'package:rick_and_morty/core/extension/media_query_extension.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/modules/settings/presentation/providers/theme_provider.dart';

class SettingsDialogLang extends StatelessWidget {
  const SettingsDialogLang({
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
            height: context.screenHeight * 0.28,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  context.lang.settingsFunctionLanguage,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Radio<AppLangMode>(
                        value: AppLangMode.en,
                        groupValue: provider.currentLocale.languageCode == 'en'
                            ? AppLangMode.en
                            : null,
                        onChanged: (AppLangMode? value) {
                          if (value != null) {
                            provider.changeLocale(Locale(value.name));
                          }
                        }),
                    Text(
                      context.lang.settingsLanguageEn,
                      style: TextStyle(),
                    )
                  ],
                ),
                Row(
                  children: [
                    Radio<AppLangMode>(
                        value: AppLangMode.ru,
                        groupValue: provider.currentLocale.languageCode == 'ru'
                            ? AppLangMode.ru
                            : null,
                        onChanged: (AppLangMode? value) {
                          if (value != null) {
                            provider.changeLocale(Locale(value.name));
                          }
                        }),
                    Text(
                      context.lang.settingsLanguageRu,
                    )
                  ],
                ),
                Row(
                  children: [
                    Radio<AppLangMode>(
                        value: AppLangMode.ky,
                        groupValue: provider.currentLocale.languageCode == 'ky'
                            ? AppLangMode.ky
                            : null,
                        onChanged: (value) {
                          provider.changeLocale(Locale(value!.name));
                        }),
                    Text(
                      context.lang.settingsLanguageKy,
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
