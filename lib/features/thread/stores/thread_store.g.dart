// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThreadStore on _ThreadStore, Store {
  final _$postsAtom = Atom(name: '_ThreadStore.posts');

  @override
  ObservableList<Post> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(ObservableList<Post> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  final _$initFutureAtom = Atom(name: '_ThreadStore.initFuture');

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

  final _$initAsyncAction = AsyncAction('_ThreadStore.init');

  @override
  Future<void> init(Thread thread) {
    return _$initAsyncAction.run(() => super.init(thread));
  }

  @override
  String toString() {
    return '''
posts: ${posts},
initFuture: ${initFuture}
    ''';
  }
}
