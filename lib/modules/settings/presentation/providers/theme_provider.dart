import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';

enum AppThemeMode { dark, light, systemTheme, battery }

enum AppLangMode { ru, en, ky }

class ThemeProvider extends ChangeNotifier {
  Locale currentLocale = Locale('en');
  AppThemeMode currentTheme = AppThemeMode.dark;

  void changeLocale(Locale newLocale) {
    currentLocale = newLocale;
    notifyListeners();
  }

  void setTheme(AppThemeMode themeMode) {
    currentTheme = themeMode;
    notifyListeners();
  }

  ThemeMode get materialThemeMode {
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    switch (currentTheme) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.battery:
        return ThemeMode.dark;
      case AppThemeMode.systemTheme:
        return isDarkMode ? ThemeMode.dark : ThemeMode.light;
    }
  }

  getThemeValue<T>({required darkValue, required lightValue}) {
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    switch (currentTheme) {
      case AppThemeMode.light:
        return lightValue;
      case AppThemeMode.dark:
        return darkValue;
      case AppThemeMode.battery:
        return darkValue;
      case AppThemeMode.systemTheme:
        return isDarkMode ? darkValue : lightValue;
    }
  }

  final darkTheme = ThemeData(
      checkboxTheme: CheckboxThemeData(
          side: const BorderSide(color: AppColors.darkSecondaryText, width: 2),
          fillColor: WidgetStateProperty.resolveWith((state) {
            if (state.contains(WidgetState.selected)) {
              return AppColors.blue;
            } else {
              return AppColors.mainDark;
            }
          })),
      radioTheme: const RadioThemeData(
          fillColor: WidgetStatePropertyAll(AppColors.blue)),
      inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: AppColors.darkSecondaryText),
          prefixIconColor: AppColors.darkSecondaryText,
          suffixIconColor: AppColors.darkSecondaryText,
          fillColor: AppColors.secondaryDark,
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(12)))),
      textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(AppColors.blue))),
      outlinedButtonTheme: const OutlinedButtonThemeData(
          style: ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(AppColors.blue),
              backgroundColor: WidgetStatePropertyAll(AppColors.mainDark),
              textStyle: WidgetStatePropertyAll(TextStyle(
                color: AppColors.blue,
              )),
              side: WidgetStatePropertyAll(
                  BorderSide(color: AppColors.blue, width: 1)),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              )))),
      elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(AppColors.darkMainText),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)))),
              backgroundColor: WidgetStatePropertyAll(AppColors.blue),
              textStyle: WidgetStatePropertyAll(
                  TextStyle(color: AppColors.darkMainText)))),
      dialogTheme: const DialogTheme(
        backgroundColor: AppColors.secondaryDark,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.mainDark,
      ),
      scaffoldBackgroundColor: AppColors.mainDark,
      textTheme: const TextTheme(
          bodySmall: TextStyle(color: AppColors.darkMainText),
          bodyLarge: TextStyle(color: AppColors.darkMainText),
          bodyMedium: TextStyle(color: AppColors.darkMainText)));

  final lightTheme = ThemeData(
      checkboxTheme: CheckboxThemeData(
          side: const BorderSide(color: AppColors.darkSecondaryText, width: 2),
          fillColor: WidgetStateProperty.resolveWith((state) {
            if (state.contains(WidgetState.selected)) {
              return AppColors.blue;
            } else {
              return AppColors.darkMainText;
            }
          })),
      radioTheme: const RadioThemeData(
          fillColor: WidgetStatePropertyAll(AppColors.blue)),
      inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: AppColors.lightSecondaryText),
          fillColor: AppColors.secondaryLight,
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(12)))),
      textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(AppColors.blue))),
      outlinedButtonTheme: const OutlinedButtonThemeData(
          style: ButtonStyle(
              side: WidgetStatePropertyAll(
                  BorderSide(color: AppColors.blue, width: 1)),
              foregroundColor: WidgetStatePropertyAll(AppColors.blue),
              backgroundColor: WidgetStatePropertyAll(AppColors.darkMainText),
              textStyle: WidgetStatePropertyAll(TextStyle(
                color: AppColors.blue,
              )),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              )))),
      elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(AppColors.darkMainText),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)))),
              backgroundColor: WidgetStatePropertyAll(AppColors.blue),
              textStyle: WidgetStatePropertyAll(
                  TextStyle(color: AppColors.darkMainText)))),
      dialogTheme: const DialogTheme(
        backgroundColor: AppColors.darkMainText,
      ),
      buttonTheme: const ButtonThemeData(buttonColor: AppColors.darkMainText),
      scaffoldBackgroundColor: AppColors.darkMainText,
      textTheme: const TextTheme(
          bodySmall: TextStyle(color: AppColors.mainDark),
          bodyLarge: TextStyle(color: AppColors.mainDark),
          bodyMedium: TextStyle(color: AppColors.mainDark)));
}
