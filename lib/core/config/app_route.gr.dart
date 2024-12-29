// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:rick_and_morty/modules/home/presentation/detail_screen.dart'
    as _i1;
import 'package:rick_and_morty/modules/home/presentation/home_screen.dart'
    as _i5;
import 'package:rick_and_morty/modules/main/presentation/main_screen.dart'
    as _i6;
import 'package:rick_and_morty/modules/settings/edit_login_screen.dart' as _i2;
import 'package:rick_and_morty/modules/settings/edit_name_screen.dart' as _i3;
import 'package:rick_and_morty/modules/settings/edit_profile_screen.dart'
    as _i4;

/// generated route for
/// [_i1.DetailScreen]
class DetailRoute extends _i7.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    _i8.Key? key,
    required String name,
    required String image,
    required String species,
    required String gender,
    required _i8.Text status,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          DetailRoute.name,
          args: DetailRouteArgs(
            key: key,
            name: name,
            image: image,
            species: species,
            gender: gender,
            status: status,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailRouteArgs>();
      return _i1.DetailScreen(
        key: args.key,
        name: args.name,
        image: args.image,
        species: args.species,
        gender: args.gender,
        status: args.status,
      );
    },
  );
}

class DetailRouteArgs {
  const DetailRouteArgs({
    this.key,
    required this.name,
    required this.image,
    required this.species,
    required this.gender,
    required this.status,
  });

  final _i8.Key? key;

  final String name;

  final String image;

  final String species;

  final String gender;

  final _i8.Text status;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, name: $name, image: $image, species: $species, gender: $gender, status: $status}';
  }
}

/// generated route for
/// [_i2.EditLoginScreen]
class EditLoginRoute extends _i7.PageRouteInfo<void> {
  const EditLoginRoute({List<_i7.PageRouteInfo>? children})
      : super(
          EditLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditLoginRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.EditLoginScreen();
    },
  );
}

/// generated route for
/// [_i3.EditNameScreen]
class EditNameRoute extends _i7.PageRouteInfo<void> {
  const EditNameRoute({List<_i7.PageRouteInfo>? children})
      : super(
          EditNameRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditNameRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.EditNameScreen();
    },
  );
}

/// generated route for
/// [_i4.EditProfileScreen]
class EditProfileRoute extends _i7.PageRouteInfo<void> {
  const EditProfileRoute({List<_i7.PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.EditProfileScreen();
    },
  );
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomeScreen();
    },
  );
}

/// generated route for
/// [_i6.MainScreen]
class MainRoute extends _i7.PageRouteInfo<void> {
  const MainRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.MainScreen();
    },
  );
}
