import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/modules/home/data/api/home_api.dart';
import 'package:rick_and_morty/modules/home/data/repository/home_repository.dart';
import 'package:rick_and_morty/modules/home/domain/repository/home_domain_repository.dart';
import 'package:rick_and_morty/modules/home/domain/usecase/fetch_all_characters_usecase.dart';
import 'package:rick_and_morty/modules/home/presentation/bloc/character_bloc/characters_bloc.dart';

final getIt = GetIt.instance;

void setupServiceCharacter() {
  final dio = Dio();
  getIt.registerLazySingleton<HomeApi>(() => HomeApi(dio));
  getIt.registerLazySingleton<HomeRepository>(
      () => HomeRepository(homeApi: getIt<HomeApi>()));
  getIt.registerLazySingleton<FetchAllCharactersUsecase>(
      () => FetchAllCharactersUsecase(repository: getIt<HomeRepository>()));
  getIt.registerFactory(
      () => CharactersBloc(fetchAllCharactersUsecase: getIt()));
}
