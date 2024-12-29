part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

class UserLoadedState extends UserState {
  final UserEntity user;

  UserLoadedState(this.user);

  @override
  List<Object?> get props => [user];
}
