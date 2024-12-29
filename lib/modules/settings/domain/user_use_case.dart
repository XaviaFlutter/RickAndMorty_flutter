import 'package:rick_and_morty/modules/settings/domain/user_entity.dart';
import 'package:rick_and_morty/modules/settings/domain/user_repository.dart';

class SaveUserUseCase {
  final UserRepository repository;

  SaveUserUseCase({required this.repository});

  Future<void> call(UserEntity userEntity) async {
    await repository.saveUserProfile(userEntity);
  }
}

class GetUserUseCase {
  final UserRepository repository;

  GetUserUseCase({required this.repository});

  Future<UserEntity> call() async {
    return await repository.getUserProfile();
  }
}
