import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/config/app_route.gr.dart';
import 'package:rick_and_morty/core/extension/locale_extension.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/core/theme/images_assets.dart';
import 'package:rick_and_morty/core/widgets/app_divider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty/core/widgets/function_button_default.dart';
import 'package:rick_and_morty/modules/settings/presentation/cubit/user_cubit.dart';
import 'package:rick_and_morty/modules/settings/presentation/providers/theme_provider.dart';
import 'package:rick_and_morty/modules/settings/widgets/app_bar_default_settings.dart';
import 'package:rick_and_morty/modules/settings/widgets/letter_text.dart';
import 'package:rick_and_morty/modules/settings/widgets/settings_dialog_lang.dart';
import 'package:rick_and_morty/modules/settings/widgets/settings_dialog_theme.dart';

class SettingsBody extends StatefulWidget {
  const SettingsBody({super.key});

  @override
  State<SettingsBody> createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  @override
  Widget build(BuildContext context) {
    final providerLocal =
        context.watch<ThemeProvider>().currentLocale.toString();
    final providerTheme = context.watch<ThemeProvider>().materialThemeMode;
    final userCubit = context.read<UserCubit>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
          if (state is UserInitial) {
            userCubit.getUser();
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserLoadedState) {
            final user = state.user;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBarDefaultSettings(
                    onTap: () {
                      context.router.popAndPush(MainRoute());
                    },
                    title: context.lang.bottomNavigationSettings),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 42,
                      backgroundImage: state.user.picture.isNotEmpty &&
                              state.user.picture != null
                          ? FileImage(File(state.user.picture))
                          : const AssetImage(ImagesAssetsApp.defaultAva),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${user.name} ${user.family}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          user.login,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: OutlinedButton(
                      onPressed: () {
                        context.pushRoute(const EditProfileRoute());
                      },
                      child: Text(
                        context.lang.editProfile,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      )),
                ),
                const AppDivider(),
                LetterTextApp(title: context.lang.settingsAppearance),
                const SizedBox(
                  height: 28,
                ),
                FunctionButtonDefault(
                    isIcon: true,
                    icon: Icon(
                      Icons.palette,
                      color: providerTheme == ThemeMode.dark
                          ? AppColors.darkMainText
                          : AppColors.mainDark,
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => SeetingsDialogTheme());
                    },
                    mainText: context.lang.settingsFunctionAppearance,
                    description: providerTheme == ThemeMode.dark
                        ? context.lang.settingsFunctionOn
                        : context.lang.settingsFunctionOff),
                const AppDivider(),
                FunctionButtonDefault(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => SettingsDialogLang());
                    },
                    mainText: context.lang.settingsFunctionLanguage,
                    description: providerLocal == 'en'
                        ? context.lang.settingsLanguageEn
                        : providerLocal == 'ru'
                            ? context.lang.settingsLanguageRu
                            : context.lang.settingsLanguageKy,
                    isIcon: true,
                    icon: Icon(
                      Icons.language_outlined,
                      color: providerTheme == ThemeMode.dark
                          ? AppColors.darkMainText
                          : AppColors.mainDark,
                    )),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        }),
      ),
    );
  }
}
