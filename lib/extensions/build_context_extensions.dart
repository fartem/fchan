import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  void push(String route, {arguments}) {
    Navigator.pushNamed(
      this,
      route,
      arguments: arguments,
    );
  }

  void pushReplace(String route, {arguments}) {
    Navigator.pushReplacementNamed(
      this,
      route,
      arguments: arguments,
    );
  }
}
