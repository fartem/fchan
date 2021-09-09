import 'package:flutter/material.dart';

final themeLight = _themeData(
  brightness: Brightness.light,
  accentColor: Colors.orangeAccent,
  colorScheme: ColorScheme.light(),
  appBarColor: Colors.grey,
);

final themeDark = _themeData(
  brightness: Brightness.dark,
  accentColor: Colors.orangeAccent,
  colorScheme: ColorScheme.dark(),
);

ThemeData _themeData({
  required Brightness brightness,
  required Color accentColor,
  required ColorScheme colorScheme,
  Color? appBarColor,
}) {
  return ThemeData(
    brightness: brightness,
    colorScheme: colorScheme.copyWith(
      primary: accentColor,
      secondary: accentColor,
    ),
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
