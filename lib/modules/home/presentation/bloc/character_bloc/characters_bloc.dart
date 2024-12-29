import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/core/enum/enum_state.dart';
import 'package:rick_and_morty/modules/home/data/repository/home_repository.dart';
import 'package:rick_and_morty/modules/home/domain/entity/character_entity.dart';
import 'package:rick_and_morty/modules/home/domain/entity/location_entity.dart';
import 'package:rick_and_morty/modules/home/domain/repository/home_domain_repository.dart';
import 'package:rick_and_morty/modules/home/domain/usecase/fetch_all_characters_usecase.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final FetchAllCharactersUsecase _fetchAllCharactersUsecase;
  List<CharacterEntity> characters = [];
  List<CharacterEntity> searchCharacters = [];
  CharactersBloc({required FetchAllCharactersUsecase fetchAllCharactersUsecase})
      : _fetchAllCharactersUsecase = fetchAllCharactersUsecase,
        super(CharactersState(
          status: StateStatus.init,
        )) {
    on<ResetCharacters>((event, emit) {
      characters.clear();
      searchCharacters.clear();
      emit(CharactersState(
        status: StateStatus.succes,
        // characterResponseEntity:
        //     CharacterResponseEntity(results: characters)
      ));
    });
    on<FetchCharactersEvent>(
      (event, emit) async {
        try {
          final result = await _fetchAllCharactersUsecase.execute(
              FetchAllCharactersParams(
                  gender: event.gender,
                  page: event.page,
                  name: event.name,
                  status: event.status));

          for (var i in result.results) {
            print(i.name);
          }

          if (event.name != null && event.name != '') {
            searchCharacters.addAll(result.results);
          } else {
            characters.addAll(result.results);
            print('characters.length:  ${characters.length}');
          }

          if (event.sort != null && event.sort != '') {
            if (event.sort == 'sort_start') {
              searchCharacters.sort((a, b) {
                return a.name!.compareTo(b.name!);
              });
              characters.sort((a, b) {
                return a.name!.compareTo(b.name!);
              });
            } else if (event.sort == 'sort_end') {
              searchCharacters.sort((a, b) {
                return b.name!.compareTo(b.name!);
              });
              characters.sort((a, b) {
                return b.name!.compareTo(b.name!);
              });
            }
          }
          emit(CharactersState(
              status: StateStatus.succes,
              characterResponseEntity: CharacterResponseEntity(
                  pages: result.pages,
                  count: result.count,
                  results: event.name == null
                      ? characters
                      : event.name == ''
                          ? characters
                          : searchCharacters)));
        } catch (e) {
          print(e);
          emit(CharactersState(status: StateStatus.error));
        }
      },
    );
  }
}
