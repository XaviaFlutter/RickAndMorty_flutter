import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty/core/config/app_route.gr.dart';
import 'package:rick_and_morty/modules/settings/edit_login_screen.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: EditLoginRoute.page),
        AutoRoute(
          page: HomeRoute.page,
        ),
        AutoRoute(
          page: EditProfileRoute.page,
        ),
        AutoRoute(page: MainRoute.page, initial: true),
        AutoRoute(
          page: EditNameRoute.page,
        ),
        AutoRoute(page: DetailRoute.page)
      ];
}
