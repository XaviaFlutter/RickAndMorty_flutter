import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/extension/locale_extension.dart';
import 'package:rick_and_morty/core/extension/media_query_extension.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/modules/home/presentation/bloc/character_bloc/characters_bloc.dart';
import 'package:rick_and_morty/modules/settings/presentation/providers/theme_provider.dart';

class TextFieldFocus extends StatelessWidget {
  TextFieldFocus({
    super.key,
    required this.searchController,
    required this.focusNode,
    required this.isSearchView,
    required this.characterBloc,
    this.debounce,
    required this.sortStatus,
    required this.genderStatus,
    required this.status,
    required this.isFilterView,
  });

  final TextEditingController searchController;
  final FocusNode focusNode;
  final ValueNotifier<bool> isSearchView;
  final ValueNotifier<bool> isFilterView;
  final CharactersBloc characterBloc;
  Timer? debounce;
  final ValueNotifier<String?> sortStatus;
  final ValueNotifier<String?> genderStatus;
  final ValueNotifier<String?> status;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, _) => ValueListenableBuilder(
          valueListenable: isSearchView,
          builder: (context, value, child) {
            return isSearchView.value
                ? Container(
                    height: 60,
                    color: provider.getThemeValue(
                        darkValue: AppColors.secondaryDark,
                        lightValue: AppColors.darkMainText),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Row(
                        spacing: 20,
                        children: [
                          IconButton(
                              color: provider.getThemeValue(
                                  darkValue: AppColors.darkMainText,
                                  lightValue: AppColors.mainDark),
                              onPressed: () {
                                isSearchView.value = !isSearchView.value;
                              },
                              icon: const Icon(Icons.arrow_back)),
                          SizedBox(
                            width: context.screenWidth * 0.6,
                            child: TextField(
                              focusNode: focusNode,
                              controller: searchController,
                              onChanged: (value) {
                                if (debounce?.isActive ?? false)
                                  debounce?.cancel();
                                debounce = Timer(
                                    const Duration(milliseconds: 900), () {
                                  characterBloc.add(ResetCharacters());
                                  characterBloc.add(FetchCharactersEvent(
                                      sort: sortStatus.value,
                                      page: 1,
                                      gender: genderStatus.value,
                                      name: searchController.text,
                                      status: status.value));
                                });
                                if (value.isEmpty) {
                                  characterBloc.add(ResetCharacters());
                                  characterBloc.add(FetchCharactersEvent(
                                      sort: sortStatus.value,
                                      gender: genderStatus.value,
                                      page: 1,
                                      status: status.value));
                                } else {
                                  characterBloc.add(ResetCharacters());
                                  characterBloc.add(FetchCharactersEvent(
                                      sort: sortStatus.value,
                                      page: 1,
                                      gender: genderStatus.value,
                                      name: searchController.text,
                                      status: status.value));
                                }
                              },
                              decoration: InputDecoration(
                                  fillColor: provider.getThemeValue(
                                    darkValue: AppColors.secondaryDark,
                                    lightValue: AppColors.darkMainText,
                                  ),
                                  filled: true),
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                isSearchView.value = !isSearchView.value;
                                searchController.clear();
                                characterBloc.add(FetchCharactersEvent());
                              },
                              icon: Icon(
                                Icons.close,
                                color: provider.getThemeValue(
                                    darkValue: AppColors.darkMainText,
                                    lightValue: AppColors.mainDark),
                              ))
                        ],
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      onTap: () {
                        focusNode.requestFocus();
                        isSearchView.value = !isSearchView.value;
                      },
                      controller: searchController,
                      onChanged: (value) {
                        if (debounce?.isActive ?? false) debounce?.cancel();
                        debounce = Timer(const Duration(milliseconds: 900), () {
                          characterBloc.add(ResetCharacters());
                          characterBloc.add(FetchCharactersEvent(
                              sort: sortStatus.value,
                              page: 1,
                              gender: genderStatus.value,
                              name: searchController.text,
                              status: status.value));
                        });
                        if (value.isEmpty) {
                          characterBloc.add(ResetCharacters());
                          characterBloc.add(FetchCharactersEvent(
                              sort: sortStatus.value,
                              gender: genderStatus.value,
                              page: 1,
                              status: status.value));
                        } else {
                          characterBloc.add(ResetCharacters());
                          characterBloc.add(FetchCharactersEvent(
                              sort: sortStatus.value,
                              page: 1,
                              gender: genderStatus.value,
                              name: searchController.text,
                              status: status.value));
                        }
                      },
                      decoration: InputDecoration(
                          hintText: context.lang.searchTextFieldHint,
                          suffixIcon: Row(
                            spacing: 5,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 25,
                                width: 0.5,
                                color: AppColors.darkSecondaryText,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    isFilterView.value = !isFilterView.value;
                                    if (isFilterView.value == false) {
                                      characterBloc.add(ResetCharacters());
                                    }
                                  },
                                  child: Icon(
                                      color: provider.getThemeValue(
                                          darkValue:
                                              AppColors.darkSecondaryText,
                                          lightValue:
                                              AppColors.lightSecondaryText),
                                      Icons.filter_alt_outlined))
                            ],
                          ),
                          prefixIcon: Icon(
                            color: provider.getThemeValue(
                                darkValue: AppColors.darkSecondaryText,
                                lightValue: AppColors.lightSecondaryText),
                            Icons.search,
                          )),
                    ),
                  );
          }),
    );
    ;
  }
}
