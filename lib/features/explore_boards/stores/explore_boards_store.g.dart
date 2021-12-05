// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_boards_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ExploreBoardsStore on _ExploreBoardsStore, Store {
  final _$boardsAtom = Atom(name: '_ExploreBoardsStore.boards');

  @override
  ObservableList<Board> get boards {
    _$boardsAtom.reportRead();
    return super.boards;
  }

  @override
  set boards(ObservableList<Board> value) {
    _$boardsAtom.reportWrite(value, super.boards, () {
      super.boards = value;
    });
  }

  final _$initFutureAtom = Atom(name: '_ExploreBoardsStore.initFuture');

  @override
  ObservableFuture<dynamic>? get initFuture {
    _$initFutureAtom.reportRead();
    return super.initFuture;
  }

  @override
  set initFuture(ObservableFuture<dynamic>? value) {
    _$initFutureAtom.reportWrite(value, super.initFuture, () {
      super.initFuture = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_ExploreBoardsStore.init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  @override
  String toString() {
    return '''
boards: ${boards},
initFuture: ${initFuture}
    ''';
  }
}
