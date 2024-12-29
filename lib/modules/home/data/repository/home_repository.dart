import 'package:flutter/material.dart';
import 'package:rick_and_morty/modules/home/data/api/home_api.dart';
import 'package:rick_and_morty/modules/home/data/model/character_model.dart';
import 'package:rick_and_morty/modules/home/data/model/episode_model.dart';
import 'package:rick_and_morty/modules/home/data/model/location_model.dart';
import 'package:rick_and_morty/modules/home/domain/repository/home_domain_repository.dart';
import 'package:rick_and_morty/modules/home/domain/usecase/fetch_all_characters_usecase.dart';

class HomeRepository implements HomeDomainRepository {
  final HomeApi _homeApi;

  HomeRepository({required HomeApi homeApi}) : _homeApi = homeApi;
  @override
  Future<CharacterModel> getCharacterById(int id) {
    return _homeApi.getCharacterById(id);
  }

  @override
  Future<EpisodeModel> getEpisodeById(int id) {
    return _homeApi.getEpisodeById(id);
  }

  @override
  Future<LocationModel> getLocationById(int id) {
    return _homeApi.getLocationById(id);
  }

  @override
  Future<CharacterResponseModel> getCharacters(
      FetchAllCharactersParams params) async {
    try {
      return await _homeApi.getCharacters(
          params.page ?? 0,
          params.name ?? '',
          params.status ?? '',
          params.species ?? '',
          params.type ?? '',
          params.gender ?? '');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<EpisodeResponseModel> getEpisodes(
      int? page, String? name, String? episodeCode) {
    return _homeApi.getEpisodes(page ?? 0, name, episodeCode);
  }

  @override
  Future<LocationResponseModel> getlocation(
      int? page, String? name, String? type, String? dimension) {
    return _homeApi.getlocation(page ?? 0, name, type, dimension);
  }
}
