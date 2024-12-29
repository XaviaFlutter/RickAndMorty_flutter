import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/extension/locale_extension.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/modules/settings/domain/user_entity.dart';
import 'package:rick_and_morty/modules/settings/presentation/cubit/user_cubit.dart';
import 'package:rick_and_morty/modules/settings/widgets/app_bar_default_settings.dart';
import 'package:rick_and_morty/modules/settings/widgets/text_field_settings_default.dart';

@RoutePage()
class EditLoginScreen extends StatefulWidget {
  const EditLoginScreen({super.key});

  @override
  State<EditLoginScreen> createState() => _EditNameScreenState();
}

class _EditNameScreenState extends State<EditLoginScreen> {
  late TextEditingController _controllerName;
  late TextEditingController _controllerFamily;
  late TextEditingController _controllerSurname;
  late TextEditingController _controllerLogin;

  @override
  void initState() {
    super.initState();
    final state = context.read<UserCubit>().state;

    if (state is UserLoadedState) {
      _controllerLogin = TextEditingController(text: state.user.login);
      _controllerName = TextEditingController(text: state.user.name);
      _controllerFamily = TextEditingController(text: state.user.family);
      _controllerSurname = TextEditingController(text: state.user.surname);
    } else {
      _controllerLogin = TextEditingController();
      _controllerName = TextEditingController();
      _controllerFamily = TextEditingController();
      _controllerSurname = TextEditingController();
    }
  }

  @override
  void dispose() {
    _controllerLogin.dispose();
    _controllerName.dispose();
    _controllerFamily.dispose();
    _controllerSurname.dispose();
    super.dispose();
  }

  void _saveProfile() {
    final state = context.read<UserCubit>().state;
    if (state is UserLoadedState) {
      final updatedUser = UserEntity(
          name: _controllerName.text,
          family: _controllerFamily.text,
          surname: _controllerSurname.text,
          picture: state.user.picture,
          login: _controllerLogin.text);
      context.read<UserCubit>().saveUser(updatedUser);
      context.maybePop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppBarDefaultSettings(title: context.lang.editProfileLogin),
                const SizedBox(height: 60),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFieldSettingsDefault(
                        controller: _controllerLogin,
                        title: context.lang.editProfileLogin),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 22),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _saveProfile,
                      child: Text(
                        context.lang.settingsFunctionSave,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
