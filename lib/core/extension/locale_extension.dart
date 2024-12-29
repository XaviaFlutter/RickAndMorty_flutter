import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/l10n/generated/l10n.dart';

extension LocaleExtension on BuildContext {
  AppLocalization get lang => AppLocalization.of(this);
}
