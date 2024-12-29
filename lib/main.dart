import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/config/app_route.dart';
import 'package:rick_and_morty/core/l10n/generated/l10n.dart';
import 'package:rick_and_morty/core/service/service_locator.dart';
import 'package:rick_and_morty/core/service/service_profile.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/modules/home/presentation/bloc/character_bloc/characters_bloc.dart';
import 'package:rick_and_morty/modules/settings/data/user_repository_impl.dart';
import 'package:rick_and_morty/modules/settings/domain/user_repository.dart';
import 'package:rick_and_morty/modules/settings/presentation/cubit/user_cubit.dart';
import 'package:rick_and_morty/modules/settings/presentation/providers/theme_provider.dart';
import 'package:rick_and_morty/modules/settings/widgets/user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  runApp(const RickAndMortyApp());
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<CharactersBloc>()),
          BlocProvider(create: (context) => sl<CharactersBloc>()),
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          BlocProvider<UserCubit>(create: (context) => getIt<UserCubit>())
        ],
        child: Consumer<ThemeProvider>(
          builder: (context, provider, _) => MaterialApp.router(
            localizationsDelegates: const {
              AppLocalization.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            },
            locale: context.watch<ThemeProvider>().currentLocale,
            supportedLocales: AppLocalization.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            themeMode: provider.materialThemeMode,
            routerDelegate: appRouter.delegate(),
            routeInformationParser: appRouter.defaultRouteParser(),
            theme: provider.lightTheme,
            darkTheme: provider.darkTheme,
          ),
        ),
      ),
    );
  }
}
