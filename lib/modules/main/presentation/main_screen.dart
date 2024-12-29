import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/modules/episodes/episodes_body.dart';
import 'package:rick_and_morty/modules/error/error_body.dart';
import 'package:rick_and_morty/modules/home/presentation/home_screen.dart';
import 'package:rick_and_morty/modules/locations/locations_body.dart';
import 'package:rick_and_morty/modules/main/presentation/widgets/main_bottom_navigation.dart';
import 'package:rick_and_morty/modules/settings/settings_body.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key, this.initialIndex = 0});
  final int initialIndex;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final ValueNotifier<int> _activeIndex;

  @override
  void initState() {
    super.initState();
    _activeIndex = ValueNotifier<int>(widget.initialIndex);
  }

  @override
  void dispose() {
    _activeIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ValueListenableBuilder(
            valueListenable: _activeIndex,
            builder: (context, value, child) => _buildBody(value),
          ),
          MainBottomNavigation(
            activeIndex: _activeIndex,
          ),
        ],
      ),
    );
  }
}

Widget _buildBody(int index) {
  switch (index) {
    case 0:
      return const HomeScreen();
    case 1:
      return const LocationsBody();
    case 2:
      return const EpisodesBody();
    case 3:
      return const SettingsBody();
    default:
      return const ErrorBody();
  }
}
