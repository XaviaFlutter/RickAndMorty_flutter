class UserEntity {
  String name;
  String family;
  String surname;
  String picture;
  String login;

  UserEntity(
      {required this.name,
      required this.family,
      required this.surname,
      required this.picture,
      required this.login});
  UserEntity copyWith({
    String? name,
    String? family,
    String? surname,
    String? picture,
    String? login,
  }) {
    return UserEntity(
      name: name ?? this.name,
      family: family ?? this.family,
      surname: surname ?? this.surname,
      picture: picture ?? this.picture,
      login: login ?? this.login,
    );
  }
}
