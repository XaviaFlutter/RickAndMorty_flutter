import 'package:flutter/material.dart';
import 'package:rick_and_morty/modules/home/presentation/widgets/filter_body.dart';

class FilterContent extends StatelessWidget {
  const FilterContent({
    super.key,
    required ValueNotifier<String?> sortStatus,
    required ValueNotifier<String?> status,
    required ValueNotifier<String?> genderStatus,
  })  : _sortStatus = sortStatus,
        _status = status,
        _genderStatus = genderStatus;

  final ValueNotifier<String?> _sortStatus;
  final ValueNotifier<String?> _status;
  final ValueNotifier<String?> _genderStatus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: FilterBody(
          sortStatus: _sortStatus,
          status: _status,
          genderStatus: _genderStatus),
    );
  }
}
