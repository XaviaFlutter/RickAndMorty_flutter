import 'dart:convert';

import 'package:rick_and_morty/core/theme/images_assets.dart';
import 'package:rick_and_morty/modules/settings/data/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDataSource {
  Future<UserModel> getUserProfile();
  Future<void> saveUserProfile(UserModel usermodel);
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;
  UserLocalDataSourceImpl(this.sharedPreferences);
  static const _profileUser = 'profile';

  @override
  Future<UserModel> getUserProfile() async {
    final jsonProfile = sharedPreferences.getString(_profileUser);
    if (jsonProfile == null) return UserModel.defaultUser();
    return UserModel.fromJson(jsonDecode(jsonProfile));
  }

  @override
  Future<void> saveUserProfile(UserModel userModel) async {
    final jsonProfile = jsonEncode(userModel.toJson());
    await sharedPreferences.setString(_profileUser, jsonProfile);
  }
}
