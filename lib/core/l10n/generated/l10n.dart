// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalization {
  AppLocalization();

  static AppLocalization? _current;

  static AppLocalization get current {
    assert(_current != null,
        'No instance of AppLocalization was loaded. Try to initialize the AppLocalization delegate before accessing AppLocalization.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalization> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalization();
      AppLocalization._current = instance;

      return instance;
    });
  }

  static AppLocalization of(BuildContext context) {
    final instance = AppLocalization.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalization present in the widget tree. Did you add AppLocalization.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalization? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  /// `Find character`
  String get searchTextFieldHint {
    return Intl.message(
      'Find character',
      name: 'searchTextFieldHint',
      desc: '',
      args: [],
    );
  }

  /// `Characters`
  String get bottomNavigationCharacters {
    return Intl.message(
      'Characters',
      name: 'bottomNavigationCharacters',
      desc: '',
      args: [],
    );
  }

  /// `Locations`
  String get bottomNavigationLocations {
    return Intl.message(
      'Locations',
      name: 'bottomNavigationLocations',
      desc: '',
      args: [],
    );
  }

  /// `Episodes`
  String get bottomNavigationEpisodes {
    return Intl.message(
      'Episodes',
      name: 'bottomNavigationEpisodes',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get bottomNavigationSettings {
    return Intl.message(
      'Settings',
      name: 'bottomNavigationSettings',
      desc: '',
      args: [],
    );
  }

  /// `TOTAL CHARACTERS:`
  String get allCharacters {
    return Intl.message(
      'TOTAL CHARACTERS:',
      name: 'allCharacters',
      desc: '',
      args: [],
    );
  }

  /// `Alive`
  String get statusCharacterAlive {
    return Intl.message(
      'Alive',
      name: 'statusCharacterAlive',
      desc: '',
      args: [],
    );
  }

  /// `Dead`
  String get statusCharacterDead {
    return Intl.message(
      'Dead',
      name: 'statusCharacterDead',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get statusCharacterUnknown {
    return Intl.message(
      'Unknown',
      name: 'statusCharacterUnknown',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get genderCharacterMale {
    return Intl.message(
      'Male',
      name: 'genderCharacterMale',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get genderCharacterFemale {
    return Intl.message(
      'Female',
      name: 'genderCharacterFemale',
      desc: '',
      args: [],
    );
  }

  /// `GenderLess`
  String get genderCharacterGenderless {
    return Intl.message(
      'GenderLess',
      name: 'genderCharacterGenderless',
      desc: '',
      args: [],
    );
  }

  /// `Filters`
  String get filterTitle {
    return Intl.message(
      'Filters',
      name: 'filterTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sort`
  String get filterCategorySort {
    return Intl.message(
      'Sort',
      name: 'filterCategorySort',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get filterCategoryStatus {
    return Intl.message(
      'Status',
      name: 'filterCategoryStatus',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get filterCategoryGender {
    return Intl.message(
      'Gender',
      name: 'filterCategoryGender',
      desc: '',
      args: [],
    );
  }

  /// `alphabetically`
  String get filterCategorySortAlphabetically {
    return Intl.message(
      'alphabetically',
      name: 'filterCategorySortAlphabetically',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get settingsEdit {
    return Intl.message(
      'Edit',
      name: 'settingsEdit',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get settingsAppearance {
    return Intl.message(
      'Appearance',
      name: 'settingsAppearance',
      desc: '',
      args: [],
    );
  }

  /// `Dark theme`
  String get settingsFunctionAppearance {
    return Intl.message(
      'Dark theme',
      name: 'settingsFunctionAppearance',
      desc: '',
      args: [],
    );
  }

  /// `Language selection`
  String get settingsFunctionLanguage {
    return Intl.message(
      'Language selection',
      name: 'settingsFunctionLanguage',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get settingsLanguageEn {
    return Intl.message(
      'English',
      name: 'settingsLanguageEn',
      desc: '',
      args: [],
    );
  }

  /// `Russian`
  String get settingsLanguageRu {
    return Intl.message(
      'Russian',
      name: 'settingsLanguageRu',
      desc: '',
      args: [],
    );
  }

  /// `Kyrgyz`
  String get settingsLanguageKy {
    return Intl.message(
      'Kyrgyz',
      name: 'settingsLanguageKy',
      desc: '',
      args: [],
    );
  }

  /// `On`
  String get settingsFunctionOn {
    return Intl.message(
      'On',
      name: 'settingsFunctionOn',
      desc: '',
      args: [],
    );
  }

  /// `Off`
  String get settingsFunctionOff {
    return Intl.message(
      'Off',
      name: 'settingsFunctionOff',
      desc: '',
      args: [],
    );
  }

  /// `Follow the system settings`
  String get settingsFunctionSystem {
    return Intl.message(
      'Follow the system settings',
      name: 'settingsFunctionSystem',
      desc: '',
      args: [],
    );
  }

  /// `Energy saving`
  String get settingsFunctionEnergySaving {
    return Intl.message(
      'Energy saving',
      name: 'settingsFunctionEnergySaving',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get settingsFunctionCancel {
    return Intl.message(
      'Cancel',
      name: 'settingsFunctionCancel',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get settingsFunctionSave {
    return Intl.message(
      'Save',
      name: 'settingsFunctionSave',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile`
  String get editProfile {
    return Intl.message(
      'Edit profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Change photo`
  String get editProfilePhoto {
    return Intl.message(
      'Change photo',
      name: 'editProfilePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get editProfileTitle {
    return Intl.message(
      'Profile',
      name: 'editProfileTitle',
      desc: '',
      args: [],
    );
  }

  /// `Change your name`
  String get editProfileName {
    return Intl.message(
      'Change your name',
      name: 'editProfileName',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get editProfileLogin {
    return Intl.message(
      'Login',
      name: 'editProfileLogin',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get editName {
    return Intl.message(
      'Name',
      name: 'editName',
      desc: '',
      args: [],
    );
  }

  /// `Family`
  String get editFamily {
    return Intl.message(
      'Family',
      name: 'editFamily',
      desc: '',
      args: [],
    );
  }

  /// `Patronymic`
  String get editPatronymic {
    return Intl.message(
      'Patronymic',
      name: 'editPatronymic',
      desc: '',
      args: [],
    );
  }

  /// `Race`
  String get race {
    return Intl.message(
      'Race',
      name: 'race',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ky'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalization> load(Locale locale) => AppLocalization.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
