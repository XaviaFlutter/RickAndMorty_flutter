import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/config/app_route.gr.dart';
import 'package:rick_and_morty/core/extension/locale_extension.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/core/theme/pagination_scroll_controller.dart';
import 'package:rick_and_morty/modules/home/presentation/bloc/character_bloc/characters_bloc.dart';

class ListViewCharacters extends StatelessWidget {
  const ListViewCharacters({
    super.key,
    required this.paginationScrollController,
    required this.state,
  });

  final PaginationScrollController paginationScrollController;
  final CharactersState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.separated(
              controller: paginationScrollController.scrollController,
              separatorBuilder: (context, index) => const SizedBox(
                height: 25,
              ),
              itemBuilder: (context, index) {
                final species =
                    state.characterResponseEntity?.results[index].species ?? '';
                final gender =
                    state.characterResponseEntity?.results[index].gender ?? '';
                final status =
                    state.characterResponseEntity?.results[index].status ?? '';
                final statusRus = Text(
                  status == 'Alive'
                      ? context.lang.statusCharacterAlive
                      : status == 'Dead'
                          ? context.lang.statusCharacterDead
                          : context.lang.statusCharacterUnknown,
                  style: TextStyle(
                      color: status == 'Alive'
                          ? AppColors.green
                          : status == 'Dead'
                              ? AppColors.red
                              : AppColors.darkSecondaryText),
                );
                final name =
                    state.characterResponseEntity?.results[index].name ?? '';
                final image =
                    state.characterResponseEntity?.results[index].image ?? '';

                return GestureDetector(
                  onTap: () {
                    context.pushRoute(DetailRoute(
                        name: name,
                        species: species,
                        status: statusRus,
                        image: image,
                        gender: gender));
                  },
                  child: SizedBox(
                    height: 75,
                    child: Row(
                      spacing: 10,
                      children: [
                        CachedNetworkImage(
                          imageUrl: image,
                          imageBuilder: (context, imageProvider) => Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: imageProvider),
                                shape: BoxShape.circle),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            statusRus,
                            Text(name),
                            Text(
                              '$species, $gender',
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.darkSecondaryText),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: state.characterResponseEntity?.results.length ?? 0,
            ),
          ),
        ],
      ),
    );
  }
}
