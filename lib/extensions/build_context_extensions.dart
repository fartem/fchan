import 'package:fchan/logic/words/fchan_words.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

extension BuildContextExtensions on BuildContext {
  FChanWords fChanWords() => GetIt.I.get();

  void push(String route, { arguments }) {
    Navigator.pushNamed(
        this,
        route,
        arguments: arguments
    );
  }
}
