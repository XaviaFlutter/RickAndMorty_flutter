import 'package:rick_and_morty/modules/home/domain/entity/character_entity.dart';

class CharacterResponseModel extends CharacterResponseEntity {
  CharacterResponseModel({
    required super.results,
    super.count,
    super.next,
    super.pages,
    super.prev,
  });
  factory CharacterResponseModel.fromJson(Map<String, dynamic> json) {
    print('${json['info']['next']}');
    return CharacterResponseModel(
      results: (json['results'] as List)
          .map((e) => CharacterModel.fromJson(e))
          .toList(),
      count: json['info']['count'] ?? 0,
      next: json['info']['next'] ?? '',
      pages: json['info']['pages'] ?? 0,
      prev: json['info']['prev'] ?? '',
    );
  }
}

class CharacterModel extends CharacterEntity {
  CharacterModel(
      {required super.id,
      required super.name,
      required super.status,
      required super.species,
      required super.type,
      required super.gender,
      required super.image});

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
        image: json['image'] ?? '',
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        status: json['status'] ?? '',
        species: json['species'] ?? '',
        type: json['type'] ?? '',
        gender: json['gender'] ?? '');
  }
}
