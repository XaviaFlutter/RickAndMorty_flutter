class CharacterResponseEntity {
  final List<CharacterEntity> results;

  final int? count;
  final int? pages;
  final String? next;
  final String? prev;
  CharacterResponseEntity(
      {required this.results,
      this.pages = 0,
      this.count = 0,
      this.next = '',
      this.prev = ''});
}

class CharacterEntity {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final String? image;

  CharacterEntity(
      {required this.image,
      required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender});
}
