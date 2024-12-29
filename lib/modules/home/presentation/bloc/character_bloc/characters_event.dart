part of 'characters_bloc.dart';

@immutable
sealed class CharactersEvent {}

class FetchCharactersEvent extends CharactersEvent {
  final int? page;
  final String? name;
  final String? status;
  final String? gender;
  final String? sort;

  FetchCharactersEvent(
      {this.sort, this.status, this.gender, this.name, this.page});
}

class ResetCharacters extends CharactersEvent {}
