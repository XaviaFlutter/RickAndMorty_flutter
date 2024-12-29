import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/extension/locale_extension.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/core/widgets/app_divider.dart';
import 'package:rick_and_morty/modules/home/presentation/widgets/checkbox_filter.dart';
import 'package:rick_and_morty/modules/settings/widgets/letter_text.dart';

class FilterBody extends StatelessWidget {
  const FilterBody({
    super.key,
    required ValueNotifier<String?> status,
    required ValueNotifier<String?> genderStatus,
    required ValueNotifier<String?> sortStatus,
  })  : _status = status,
        _genderStatus = genderStatus,
        _sortStatus = sortStatus;

  final ValueNotifier<String?> _sortStatus;
  final ValueNotifier<String?> _status;
  final ValueNotifier<String?> _genderStatus;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24,
          children: [
            LetterTextApp(title: context.lang.filterCategorySort),
            ValueListenableBuilder(
              valueListenable: _sortStatus,
              builder: (context, value, child) => Row(
                children: [
                  Text(context.lang.filterCategorySortAlphabetically),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        if (_sortStatus.value == 'sort_start') {
                          _sortStatus.value = null;
                        } else {
                          _sortStatus.value = 'sort_start';
                        }
                      },
                      icon: Icon(
                          color: _sortStatus.value == 'sort_start'
                              ? AppColors.blue
                              : AppColors.darkSecondaryText,
                          Icons.sort_rounded)),
                  IconButton(
                      onPressed: () {
                        if (_sortStatus.value == 'sort_end') {
                          _sortStatus.value = null;
                        } else {
                          _sortStatus.value = 'sort_end';
                        }
                      },
                      icon: Transform.flip(
                          flipY: true,
                          child: Icon(
                              color: _sortStatus.value == 'sort_end'
                                  ? AppColors.blue
                                  : AppColors.darkSecondaryText,
                              Icons.sort_rounded)))
                ],
              ),
            )
          ],
        ),
        const AppDivider(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24,
          children: [
            LetterTextApp(title: context.lang.filterCategoryStatus),
            CheckboxFilter(
                status: _status,
                statusValue: 'Alive',
                text: context.lang.statusCharacterAlive),
            CheckboxFilter(
                status: _status,
                statusValue: 'Dead',
                text: context.lang.statusCharacterDead),
            CheckboxFilter(
                status: _status,
                statusValue: 'Unknown',
                text: context.lang.statusCharacterUnknown),
          ],
        ),
        const AppDivider(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24,
          children: [
            LetterTextApp(title: context.lang.filterCategoryGender),
            CheckboxFilter(
                status: _genderStatus,
                statusValue: 'Male',
                text: context.lang.genderCharacterMale),
            CheckboxFilter(
                status: _genderStatus,
                statusValue: 'Female',
                text: context.lang.genderCharacterFemale),
            CheckboxFilter(
                status: _genderStatus,
                statusValue: 'Genderless',
                text: context.lang.genderCharacterGenderless),
          ],
        ),
      ],
    );
  }
}
