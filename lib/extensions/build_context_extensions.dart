import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../logic/words/fchan_words.dart';

extension BuildContextExtensions on BuildContext {
  FChanWords fChanWords() => GetIt.I.get();

  void push(String route, { arguments }) {
    Navigator.pushNamed(
      this,
      route,
      arguments: arguments,
    );
  }

  void pushReplace(String route, { arguments }) {
    Navigator.pushReplacementNamed(
      this,
      route,
      arguments: arguments,
    );
  }
}
