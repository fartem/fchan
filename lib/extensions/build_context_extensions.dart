import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextNavigationExtensions on BuildContext {
  Future<void> push({
    required String route,
    arguments,
  }) =>
      Navigator.pushNamed(
        this,
        route,
        arguments: arguments,
      );

  Future<void> pushReplace({
    required String route,
    arguments,
  }) =>
      Navigator.pushReplacementNamed(
        this,
        route,
        arguments: arguments,
      );
}

extension BuildContextLocalizationExtensions on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this)!;
}
