import 'package:rick_and_morty/core/enum/enum_state.dart';
import 'package:rick_and_morty/modules/home/domain/entity/character_entity.dart';

class CharactersState {
  final StateStatus status;
  final CharacterResponseEntity? characterResponseEntity;

  CharactersState({
    required this.status,
    this.characterResponseEntity,
  });

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
