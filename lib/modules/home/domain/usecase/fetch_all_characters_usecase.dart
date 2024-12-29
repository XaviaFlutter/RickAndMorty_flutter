import 'package:rick_and_morty/modules/home/domain/entity/character_entity.dart';
import 'package:rick_and_morty/modules/home/domain/repository/home_domain_repository.dart';

class FetchAllCharactersUsecase {
  final HomeDomainRepository _repository;

  FetchAllCharactersUsecase({required HomeDomainRepository repository})
      : _repository = repository;
  Future<CharacterResponseEntity> execute(FetchAllCharactersParams params) {
    return _repository.getCharacters(params);
  }
}

class FetchAllCharactersParams {
  final int? page;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;

  FetchAllCharactersParams(
      {this.page,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender});
}
