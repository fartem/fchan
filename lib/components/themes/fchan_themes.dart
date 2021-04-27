import 'package:flutter/material.dart';

final themeLight = _themeData(
  Brightness.light,
  Colors.orangeAccent,
  appBarColor: Colors.grey,
);

final themeDark = _themeData(
  Brightness.dark,
  Colors.orangeAccent,
);

ThemeData _themeData(
  Brightness brightness,
  Color accentColor, {
  Color? appBarColor,
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
