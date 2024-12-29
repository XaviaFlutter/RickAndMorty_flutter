import 'package:rick_and_morty/modules/settings/data/user_local_data_source.dart';
import 'package:rick_and_morty/modules/settings/data/user_model.dart';
import 'package:rick_and_morty/modules/settings/domain/user_entity.dart';
import 'package:rick_and_morty/modules/settings/domain/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource userLocalDataSource;

  UserRepositoryImpl({required this.userLocalDataSource});

  @override
  Future<void> saveUserProfile(UserEntity userEntity) async {
    return await userLocalDataSource.saveUserProfile(UserModel(
        name: userEntity.name,
        family: userEntity.family,
        surname: userEntity.surname,
        login: userEntity.login,
        picture: userEntity.picture));
  }

  @override
  Future<UserEntity> getUserProfile() async {
    return await userLocalDataSource.getUserProfile();
  }
}
