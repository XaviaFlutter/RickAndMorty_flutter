import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/core/service/service_character.dart';
import 'package:rick_and_morty/core/service/service_profile.dart';

final sl = GetIt.instance;

void setupDependencies() {
  setupServiceCharacter();
  setupServiceProfile();
}
