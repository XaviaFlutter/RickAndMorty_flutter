import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/extension/locale_extension.dart';
import 'package:rick_and_morty/core/extension/media_query_extension.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/core/widgets/function_button_default.dart';
import 'package:rick_and_morty/modules/settings/presentation/providers/theme_provider.dart';

@RoutePage()
class DetailScreen extends StatelessWidget {
  final String name;
  final String image;
  final String species;
  final String gender;
  final Text status;
  const DetailScreen(
      {super.key,
      required this.name,
      required this.image,
      required this.species,
      required this.gender,
      required this.status});

  @override
  Widget build(BuildContext context) {
    final providerTheme = context.watch<ThemeProvider>().materialThemeMode;
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
              imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover, image: imageProvider)),
                    width: double.infinity,
                    height: context.screenHeight * 0.30,
                    child: Stack(
                      children: [
                        BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.0)),
                            )),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.mainDark.withValues(alpha: 0.5)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                Colors.black.withValues(alpha: 0.5),
                                AppColors.mainDark.withValues(alpha: 0.0)
                              ])),
                        ),
                        Container(
                            height: 100,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                  Colors.black.withValues(alpha: 0.5),
                                  AppColors.mainDark.withValues(alpha: 0.0)
                                ]))),
                      ],
                    ),
                  ),
              imageUrl: image),
          Padding(
            padding:
                EdgeInsets.only(left: 20, top: context.screenHeight * 0.05),
            child: SizedBox(
              height: 30,
              width: 30,
              child: IconButton(
                  onPressed: () {
                    context.router.maybePop();
                  },
                  icon: Icon(
                    Icons.keyboard_backspace,
                    color: providerTheme == ThemeMode.dark
                        ? AppColors.darkMainText
                        : AppColors.mainDark,
                  )),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  color: providerTheme == ThemeMode.dark
                      ? AppColors.mainDark
                      : AppColors.darkMainText),
              width: double.infinity,
              height: context.screenHeight * 0.75,
              child: Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      right: 0,
                      left: 0,
                      top: -85,
                      child: SizedBox(
                        height: 160,
                        width: 160,
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: AlignmentDirectional.center,
                          children: [
                            Container(
                              width: 160,
                              height: 160,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: providerTheme == ThemeMode.dark
                                      ? AppColors.mainDark
                                      : AppColors.darkMainText),
                            ),
                            CachedNetworkImage(
                              imageUrl: image,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: 145,
                                height: 145,
                                decoration: BoxDecoration(
                                    image:
                                        DecorationImage(image: imageProvider),
                                    shape: BoxShape.circle),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 80,
                          ),
                          Text(
                            name,
                            style: const TextStyle(fontSize: 35),
                          ),
                          status,
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              spacing: context.screenWidth * 0.3,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: FunctionButtonDefault(
                                    onTap: () {},
                                    mainText: gender,
                                    description:
                                        context.lang.filterCategoryGender,
                                    isDetail: true,
                                    isFunction: false,
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: FunctionButtonDefault(
                                    onTap: () {},
                                    mainText: species,
                                    description: context.lang.race,
                                    isDetail: true,
                                    isFunction: false,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
