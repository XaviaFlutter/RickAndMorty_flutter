import 'package:rick_and_morty/core/theme/images_assets.dart';
import 'package:rick_and_morty/modules/settings/domain/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.name,
      required super.family,
      required super.surname,
      required super.login,
      required super.picture});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        family: json["family"],
        surname: json["surname"],
        picture: json["picture"],
        login: json["login"],
      );
  Map<String, dynamic> toJson() => {
        "name": name,
        "family": family,
        "surname": surname,
        "picture": picture,
        "login": login,
      };
  static UserModel defaultUser() {
    return UserModel(
        name: 'Morty',
        family: 'Smith',
        surname: '',
        login: 'morty',
        picture: ImagesAssetsApp.defaultAva);
  }
}
