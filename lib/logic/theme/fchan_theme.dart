import 'dart:math';

import 'package:flutter/material.dart';

class FChanTheme {

  static const _accentColors = <MaterialColor>[
    Colors.green,
    Colors.blue,
    Colors.cyan,
    Colors.indigo,
    Colors.red,
  ];

  ThemeData get light => _themeData(
    Brightness.light,
    _randomColor(),
    appBarColor: Colors.grey,
  );
  ThemeData get dark => _themeData(
    Brightness.dark,
    _randomColor(),
  );

  static ThemeData _themeData(
      Brightness brightness,
      Color accentColor,
      { Color appBarColor }
  ) {
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

  static Color _randomColor() {
    return _accentColors[Random().nextInt(_accentColors.length)];
  }

}
