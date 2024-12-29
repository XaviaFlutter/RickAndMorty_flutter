import 'package:bloc/bloc.dart';
import 'package:rick_and_morty/core/enum/enum_state.dart';
import 'package:rick_and_morty/modules/home/domain/entity/character_entity.dart';
import 'package:rick_and_morty/modules/home/domain/usecase/fetch_all_characters_usecase.dart';
import 'package:rick_and_morty/modules/home/presentation/bloc/character_bloc/characters_bloc.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final FetchAllCharactersUsecase _fetchAllCharactersUsecase;
  List<CharacterEntity> _characters = [];
  List<CharacterEntity> _searchCharacters = [];

  CharactersCubit(
      {required FetchAllCharactersUsecase fetchAllCharactersUsecase})
      : _fetchAllCharactersUsecase = fetchAllCharactersUsecase,
        super(CharactersState(status: StateStatus.init));

  /// Сброс поиска
  void resetSearch() {
    _searchCharacters.clear();
    emit(CharactersState(status: StateStatus.init));
  }

  /// Поиск персонажей по имени
  Future<void> searchCharacters(String name) async {
    try {
      emit(state.copyWith(status: StateStatus.loading));

      final result = await _fetchAllCharactersUsecase.execute(
        FetchAllCharactersParams(page: 1, name: name),
      );

      _searchCharacters = result.results;
      emit(CharactersState(
        status: StateStatus.succes,
        characterResponseEntity: CharacterResponseEntity(
          pages: result.pages,
          count: result.count,
          results: _searchCharacters,
        ),
      ));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: StateStatus.error));
    }
  }
}
