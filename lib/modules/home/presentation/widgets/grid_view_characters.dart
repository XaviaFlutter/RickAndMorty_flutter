import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/config/app_route.gr.dart';
import 'package:rick_and_morty/core/extension/locale_extension.dart';
import 'package:rick_and_morty/core/extension/media_query_extension.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/core/theme/pagination_scroll_controller.dart';
import 'package:rick_and_morty/modules/home/presentation/bloc/character_bloc/characters_bloc.dart';

class GridViewCharacters extends StatelessWidget {
  const GridViewCharacters({
    super.key,
    required this.paginationScrollController,
    required this.state,
  });

  final PaginationScrollController paginationScrollController;
  final CharactersState state;

  @override
  Widget build(BuildContext context) {
    print(context.screenWidth.round());
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.builder(
              scrollDirection:
                  context.screenWidth <= 470 ? Axis.horizontal : Axis.vertical,
              controller: paginationScrollController.scrollController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: context.screenWidth <= 470 ? 3 : 2),
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
                    width: context.screenWidth <= 470 ? 120 : 200,
                    child: Column(
                      spacing: 10,
                      children: [
                        CachedNetworkImage(
                          imageUrl: image,
                          imageBuilder: (context, imageProvider) => Container(
                            width: context.screenWidth <= 470 ? 60 : 120,
                            height: context.screenWidth <= 470 ? 60 : 120,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: imageProvider),
                                shape: BoxShape.circle),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
