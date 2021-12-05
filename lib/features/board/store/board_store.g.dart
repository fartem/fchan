// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BoardStore on _BoardStore, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading => (_$isLoadingComputed ??=
          Computed<bool>(() => super.isLoading, name: '_BoardStore.isLoading'))
      .value;

  final _$threadsAtom = Atom(name: '_BoardStore.threads');

  @override
  ObservableList<Thread> get threads {
    _$threadsAtom.reportRead();
    return super.threads;
  }

  @override
  set threads(ObservableList<Thread> value) {
    _$threadsAtom.reportWrite(value, super.threads, () {
      super.threads = value;
    });
  }

  final _$initFutureAtom = Atom(name: '_BoardStore.initFuture');

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

  final _$isLastPageAtom = Atom(name: '_BoardStore.isLastPage');

  @override
  bool get isLastPage {
    _$isLastPageAtom.reportRead();
    return super.isLastPage;
  }

  @override
  set isLastPage(bool value) {
    _$isLastPageAtom.reportWrite(value, super.isLastPage, () {
      super.isLastPage = value;
    });
  }

  @override
  String toString() {
    return '''
threads: ${threads},
initFuture: ${initFuture},
isLastPage: ${isLastPage},
isLoading: ${isLoading}
    ''';
  }
}
