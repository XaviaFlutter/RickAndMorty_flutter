import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/extension/locale_extension.dart';
import 'package:rick_and_morty/core/extension/media_query_extension.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/core/theme/pagination_scroll_controller.dart';
import 'package:rick_and_morty/modules/home/presentation/bloc/character_bloc/characters_bloc.dart';
import 'package:rick_and_morty/modules/settings/presentation/providers/theme_provider.dart';

class FilterAppBar extends StatelessWidget {
  const FilterAppBar({
    super.key,
    required ValueNotifier<bool> isFilterView,
    required this.paginationScrollController,
    required CharactersBloc characterBloc,
    required ValueNotifier<String?> sortStatus,
    required ValueNotifier<String?> status,
    required TextEditingController searchController,
    required ValueNotifier<String?> genderStatus,
  })  : _isFilterView = isFilterView,
        _characterBloc = characterBloc,
        _sortStatus = sortStatus,
        _status = status,
        _searchController = searchController,
        _genderStatus = genderStatus;

  final ValueNotifier<bool> _isFilterView;
  final PaginationScrollController paginationScrollController;
  final CharactersBloc _characterBloc;
  final ValueNotifier<String?> _sortStatus;
  final ValueNotifier<String?> _status;
  final TextEditingController _searchController;
  final ValueNotifier<String?> _genderStatus;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, _) => Container(
        height: context.screenHeight * 0.08,
        color: provider.materialThemeMode == ThemeMode.dark
            ? AppColors.secondaryDark
            : AppColors.secondaryLight,
        child: Row(
          spacing: 20,
          children: [
            IconButton(
                color: provider.getThemeValue(
                    darkValue: AppColors.darkMainText,
                    lightValue: AppColors.mainDark),
                onPressed: () {
                  _isFilterView.value = !_isFilterView.value;
                  paginationScrollController.currentPage = 1;
                  _characterBloc.add(ResetCharacters());
                  _characterBloc.add(FetchCharactersEvent(
                      sort: _sortStatus.value,
                      page: paginationScrollController.currentPage,
                      status: _status.value,
                      name: _searchController.text,
                      gender: _genderStatus.value));
                  paginationScrollController.currentPage++;
                },
                icon: const Icon(Icons.arrow_back)),
            Text(
              context.lang.filterTitle,
              style: const TextStyle(fontSize: 20),
            ),
            const Spacer(),
            ValueListenableBuilder(
                valueListenable: _status,
                builder: (context, statusValue, child) {
                  return ValueListenableBuilder(
                      valueListenable: _sortStatus,
                      builder: (context, statusSort, child) {
                        return ValueListenableBuilder(
                          valueListenable: _genderStatus,
                          builder: (context, genderValue, child) {
                            if (statusValue == null &&
                                genderValue == null &&
                                statusSort == null) {
                              return const SizedBox.shrink();
                            } else {
                              return IconButton(
                                onPressed: () {
                                  _sortStatus.value = null;
                                  _status.value = null;
                                  _genderStatus.value = null;
                                },
                                icon: const Icon(
                                  Icons.filter_alt,
                                  color: AppColors.red,
                                ),
                              );
                            }
                          },
                        );
                      });
                })
          ],
        ),
      ),
    );
  }
}
