import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  void push({
    required String route,
    arguments,
  }) {
    Navigator.pushNamed(
      this,
      route,
      arguments: arguments,
    );
  }

  void pushReplace({required String route, arguments}) {
    Navigator.pushReplacementNamed(
      this,
      route,
      arguments: arguments,
    );
  }
}
