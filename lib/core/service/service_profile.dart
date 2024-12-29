import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/modules/settings/data/user_local_data_source.dart';
import 'package:rick_and_morty/modules/settings/data/user_repository_impl.dart';
import 'package:rick_and_morty/modules/settings/domain/user_repository.dart';
import 'package:rick_and_morty/modules/settings/presentation/cubit/user_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupServiceProfile() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  getIt.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(getIt<SharedPreferences>()),
  );
  getIt.registerFactory<UserCubit>(
    () => UserCubit(getIt<UserRepository>()),
  );
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(userLocalDataSource: getIt<UserLocalDataSource>()),
  );
}
