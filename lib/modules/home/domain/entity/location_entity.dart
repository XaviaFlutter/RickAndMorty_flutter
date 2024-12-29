class LocationReponseEntity {
  final List<LocationEntity> results;
  final int? count;
  final int? pages;

  LocationReponseEntity(
      {required this.results, required this.count, required this.pages});
}

class LocationEntity {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  final String url;
  final String created;

  LocationEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });
}
