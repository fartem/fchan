import 'package:flutter/material.dart';

extension BuildContextThemeExtensions on BuildContext {
  Color get accentColor => Theme.of(this).accentColor;
}
