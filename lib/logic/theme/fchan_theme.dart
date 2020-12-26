import 'dart:math';

import 'package:flutter/material.dart';

const _accentColors = <MaterialColor>[
  Colors.green,
  Colors.blue,
  Colors.cyan,
  Colors.indigo,
  Colors.red,
];

final themeLight = _themeData(
  Brightness.light,
  _randomColor(),
  appBarColor: Colors.grey,
);

final themeDark = _themeData(
  Brightness.dark,
  _randomColor(),
);

ThemeData _themeData(
  Brightness brightness,
  Color accentColor, {
  Color appBarColor,
}) {
  return ThemeData(
    brightness: brightness,
    accentColor: accentColor,
    appBarTheme: AppBarTheme(
      color: appBarColor,
      elevation: 0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: accentColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: accentColor,
    ),
  );
}

Color _randomColor() => _accentColors[Random().nextInt(_accentColors.length)];
