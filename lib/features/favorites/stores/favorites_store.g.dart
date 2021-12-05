// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoritesStore on _FavoritesStore, Store {
  final _$favoritesAtom = Atom(name: '_FavoritesStore.favorites');

  @override
  ObservableSet<Board> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(ObservableSet<Board> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  final _$initFutureAtom = Atom(name: '_FavoritesStore.initFuture');

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

  final _$loadAsyncAction = AsyncAction('_FavoritesStore.load');

  @override
  Future<void> load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  final _$addToFavoritesAsyncAction =
      AsyncAction('_FavoritesStore.addToFavorites');

  @override
  Future<void> addToFavorites(Board board) {
    return _$addToFavoritesAsyncAction.run(() => super.addToFavorites(board));
  }

  final _$removeFromFavoritesAsyncAction =
      AsyncAction('_FavoritesStore.removeFromFavorites');

  @override
  Future<void> removeFromFavorites(Board board) {
    return _$removeFromFavoritesAsyncAction
        .run(() => super.removeFromFavorites(board));
  }

  @override
  String toString() {
    return '''
favorites: ${favorites},
initFuture: ${initFuture}
    ''';
  }
}
