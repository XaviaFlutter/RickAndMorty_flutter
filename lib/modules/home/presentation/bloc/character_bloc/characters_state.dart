part of 'characters_bloc.dart';

@immutable
class CharactersState {
  final StateStatus status;
  final CharacterResponseEntity? characterResponseEntity;
  final LocationEntity? locationEntity;

  CharactersState(
      {required this.status,
      this.characterResponseEntity,
      this.locationEntity});

  CharactersState copyWith({
    StateStatus? status,
    CharacterResponseEntity? characterResponseEntity,
  }) {
    return CharactersState(
      status: status ?? this.status,
      characterResponseEntity:
          characterResponseEntity ?? this.characterResponseEntity,
    );
  }
}
