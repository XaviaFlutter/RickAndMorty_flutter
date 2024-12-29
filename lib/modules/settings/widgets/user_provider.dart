import 'package:flutter/material.dart';
import 'package:rick_and_morty/modules/settings/domain/user_entity.dart';

class UserProvider extends ChangeNotifier {
  UserEntity? _user;

  UserEntity? get user => _user;

  void loadUser(UserEntity user) {
    _user = user;
    notifyListeners();
  }

  void updateUserName(String newName) {
    if (_user != null) {
      _user = UserEntity(
          name: _user!.name,
          family: _user!.family,
          surname: _user!.surname,
          picture: _user!.picture,
          login: _user!.login);
      notifyListeners();
    }
  }
}
