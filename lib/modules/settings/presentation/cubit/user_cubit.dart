import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/modules/settings/domain/user_entity.dart';
import 'package:rick_and_morty/modules/settings/domain/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;
  UserCubit(this.userRepository) : super(UserInitial());

  Future<void> getUser() async {
    try {
      final user = await userRepository.getUserProfile();
      emit(UserLoadedState(user));
    } catch (e) {
      emit(UserInitial());
    }
  }

  Future<void> saveUser(UserEntity user) async {
    await userRepository.saveUserProfile(user);
    emit(UserLoadedState(user));
  }
}
