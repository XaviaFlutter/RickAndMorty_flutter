import 'package:rick_and_morty/modules/settings/domain/user_entity.dart';

abstract class UserRepository {
  Future<void> saveUserProfile(UserEntity user);
  Future<UserEntity> getUserProfile();
}
