import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rick_and_morty/core/config/app_route.gr.dart';
import 'package:rick_and_morty/core/extension/locale_extension.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/core/theme/images_assets.dart';
import 'package:rick_and_morty/core/widgets/function_button_default.dart';
import 'package:rick_and_morty/modules/settings/edit_login_screen.dart';
import 'package:rick_and_morty/modules/settings/presentation/cubit/user_cubit.dart';
import 'package:rick_and_morty/modules/settings/widgets/app_bar_default_settings.dart';
import 'package:rick_and_morty/modules/settings/widgets/letter_text.dart';
import 'package:rick_and_morty/modules/settings/widgets/user_provider.dart';

@RoutePage()
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();
    Future<void> _pickImage(BuildContext context) async {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final newImage = File(pickedFile.path);
        final userCubit = context.read<UserCubit>();
        final currentState = userCubit.state;
        if (currentState is UserLoadedState) {
          final updatedUser =
              currentState.user.copyWith(picture: newImage.path);
          userCubit.saveUser(updatedUser);
        }
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarDefaultSettings(title: context.lang.editProfile),
              SizedBox(
                width: double.infinity,
                height: 270,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<UserCubit, UserState>(
                        builder: (context, state) {
                      if (state is UserLoadedState) {
                        final user = state.user;
                        return CircleAvatar(
                          radius: 75,
                          backgroundImage: FileImage(File(user.picture)),
                        );
                      } else if (state is UserInitial) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () => _pickImage(context),
                      child: Text(
                        context.lang.editProfilePhoto,
                        style: const TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              LetterTextApp(title: context.lang.editProfileTitle),
              const SizedBox(
                height: 24,
              ),
              BlocBuilder<UserCubit, UserState>(builder: (context, state) {
                if (state is UserLoadedState) {
                  final user = state.user;
                  return Column(
                    children: [
                      FunctionButtonDefault(
                          onTap: () => context.pushRoute(const EditNameRoute()),
                          mainText: context.lang.editProfileName,
                          description:
                              '${user.name} ${user.family} ${user.surname}'),
                      SizedBox(
                        height: 20,
                      ),
                      FunctionButtonDefault(
                          onTap: () =>
                              context.pushRoute(const EditLoginRoute()),
                          mainText: context.lang.editProfileLogin,
                          description: user.login)
                    ],
                  );
                } else if (state is UserInitial) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return SizedBox.shrink();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
