import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/enum/enum_state.dart';
import 'package:rick_and_morty/core/extension/locale_extension.dart';
import 'package:rick_and_morty/core/service/service_locator.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/core/theme/images_assets.dart';
import 'package:rick_and_morty/core/theme/pagination_scroll_controller.dart';
import 'package:rick_and_morty/modules/home/presentation/bloc/character_bloc/characters_bloc.dart';
import 'package:rick_and_morty/modules/home/presentation/widgets/filter_app_bar.dart';
import 'package:rick_and_morty/modules/home/presentation/widgets/filter_content.dart';
import 'package:rick_and_morty/modules/home/presentation/widgets/grid_view_characters.dart';
import 'package:rick_and_morty/modules/home/presentation/widgets/list_view_characters.dart';
import 'package:rick_and_morty/modules/home/presentation/widgets/not_found_characters.dart';
import 'package:rick_and_morty/modules/home/presentation/widgets/text_field_focus.dart';
import 'package:rick_and_morty/modules/settings/presentation/providers/theme_provider.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PaginationScrollController paginationScrollController =
      PaginationScrollController();
  final _characterBloc = sl<CharactersBloc>();
  final _searchController = TextEditingController();
  int _maxPages = 0;
  Timer? _debounce;
  final _isFilterView = ValueNotifier<bool>(false);
  final _status = ValueNotifier<String?>(null);
  final _sortStatus = ValueNotifier<String?>(null);
  final _genderStatus = ValueNotifier<String?>(null);
  final _isGrid = ValueNotifier<bool>(false);
  final _isSearchView = ValueNotifier<bool>(false);
  late FocusNode _focusNode;
  @override
  void initState() {
    _focusNode = FocusNode();

    paginationScrollController.init(
        initAction: () => _characterBloc.add(FetchCharactersEvent(
              page: 0,
            )),
        loadAction: () async {
          if (paginationScrollController.currentPage <= _maxPages) {
            print('loadAction - ${paginationScrollController.currentPage}');
            return _characterBloc.add(FetchCharactersEvent(
                sort: _sortStatus.value,
                gender: _genderStatus.value,
                status: _status.value,
                name: _searchController.text,
                page: paginationScrollController.currentPage));
          }
        });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    paginationScrollController.dispose();
    _searchController.dispose();
    _debounce?.cancel();
    _isFilterView.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: BlocProvider.value(
        value: _characterBloc,
        child: Consumer<ThemeProvider>(
          builder: (context, provider, _) => Column(
            children: [
              ValueListenableBuilder(
                  valueListenable: _isFilterView,
                  builder: (context, value, child) {
                    if (value) {
                      return FilterAppBar(
                          isFilterView: _isFilterView,
                          paginationScrollController:
                              paginationScrollController,
                          characterBloc: _characterBloc,
                          sortStatus: _sortStatus,
                          status: _status,
                          searchController: _searchController,
                          genderStatus: _genderStatus);
                    } else {
                      return TextFieldFocus(
                        isFilterView: _isFilterView,
                        searchController: _searchController,
                        focusNode: _focusNode,
                        isSearchView: _isSearchView,
                        characterBloc: _characterBloc,
                        debounce: _debounce,
                        sortStatus: _sortStatus,
                        genderStatus: _genderStatus,
                        status: _status,
                      );
                    }
                  }),
              ValueListenableBuilder(
                  valueListenable: _isFilterView,
                  builder: (context, value, child) {
                    if (value) {
                      return FilterContent(
                          sortStatus: _sortStatus,
                          status: _status,
                          genderStatus: _genderStatus);
                    } else {
                      return Expanded(
                        child: BlocBuilder<CharactersBloc, CharactersState>(
                          builder: (context, state) {
                            if (state.status == StateStatus.succes) {
                              _maxPages =
                                  state.characterResponseEntity?.pages ?? 0;
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                            style: const TextStyle(
                                                letterSpacing: 1.5,
                                                fontSize: 10,
                                                color: AppColors
                                                    .darkSecondaryText),
                                            '${context.lang.allCharacters}: ${state.characterResponseEntity?.count ?? 0}'),
                                        const Spacer(),
                                        IconButton(
                                            onPressed: () {
                                              setState(
                                                () {
                                                  _isGrid.value =
                                                      !_isGrid.value;
                                                },
                                              );
                                            },
                                            icon: Icon(
                                              _isGrid.value
                                                  ? Icons.grid_view_rounded
                                                  : Icons.list,
                                              color:
                                                  AppColors.darkSecondaryText,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      child: _isGrid.value
                                          ? ListViewCharacters(
                                              state: state,
                                              paginationScrollController:
                                                  paginationScrollController)
                                          : GridViewCharacters(
                                              paginationScrollController:
                                                  paginationScrollController,
                                              state: state)),
                                ],
                              );
                            } else if (state.status == StateStatus.error) {
                              return Center(
                                  child: _searchController != ''
                                      ? NotFoundCharacters()
                                      : Column(
                                          spacing: 10,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                                height: 300,
                                                width: 300,
                                                child: Image.asset(
                                                    ImagesAssetsApp
                                                        .mortyFilterError)),
                                            const Text(
                                              'По данным фильтра ничего\n не найдено',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: AppColors
                                                      .darkSecondaryText),
                                            ),
                                          ],
                                        ));
                            } else {
                              return const SizedBox.shrink();
                            }
                          },
                        ),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    ));
  }
}
