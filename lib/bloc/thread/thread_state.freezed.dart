// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'thread_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ThreadStateTearOff {
  const _$ThreadStateTearOff();

  ThreadStateInitial initial() {
    return const ThreadStateInitial();
  }

  ThreadStateLoadSuccess loadSuccess({required List<Post> posts}) {
    return ThreadStateLoadSuccess(
      posts: posts,
    );
  }

  ThreadStateLoadError loadError() {
    return const ThreadStateLoadError();
  }

  ThreadStateThreadsListIsEmpty threadsListIsEmpty() {
    return const ThreadStateThreadsListIsEmpty();
  }
}

/// @nodoc
const $ThreadState = _$ThreadStateTearOff();

/// @nodoc
mixin _$ThreadState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Post> posts) loadSuccess,
    required TResult Function() loadError,
    required TResult Function() threadsListIsEmpty,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Post> posts)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? threadsListIsEmpty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ThreadStateInitial value) initial,
    required TResult Function(ThreadStateLoadSuccess value) loadSuccess,
    required TResult Function(ThreadStateLoadError value) loadError,
    required TResult Function(ThreadStateThreadsListIsEmpty value) threadsListIsEmpty,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ThreadStateInitial value)? initial,
    TResult Function(ThreadStateLoadSuccess value)? loadSuccess,
    TResult Function(ThreadStateLoadError value)? loadError,
    TResult Function(ThreadStateThreadsListIsEmpty value)? threadsListIsEmpty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreadStateCopyWith<$Res> {
  factory $ThreadStateCopyWith(ThreadState value, $Res Function(ThreadState) then) = _$ThreadStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ThreadStateCopyWithImpl<$Res> implements $ThreadStateCopyWith<$Res> {
  _$ThreadStateCopyWithImpl(this._value, this._then);

  final ThreadState _value;

  // ignore: unused_field
  final $Res Function(ThreadState) _then;
}

/// @nodoc
abstract class $ThreadStateInitialCopyWith<$Res> {
  factory $ThreadStateInitialCopyWith(ThreadStateInitial value, $Res Function(ThreadStateInitial) then) =
      _$ThreadStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$ThreadStateInitialCopyWithImpl<$Res> extends _$ThreadStateCopyWithImpl<$Res>
    implements $ThreadStateInitialCopyWith<$Res> {
  _$ThreadStateInitialCopyWithImpl(ThreadStateInitial _value, $Res Function(ThreadStateInitial) _then)
      : super(_value, (v) => _then(v as ThreadStateInitial));

  @override
  ThreadStateInitial get _value => super._value as ThreadStateInitial;
}

/// @nodoc
class _$ThreadStateInitial implements ThreadStateInitial {
  const _$ThreadStateInitial();

  @override
  String toString() {
    return 'ThreadState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ThreadStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Post> posts) loadSuccess,
    required TResult Function() loadError,
    required TResult Function() threadsListIsEmpty,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Post> posts)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? threadsListIsEmpty,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ThreadStateInitial value) initial,
    required TResult Function(ThreadStateLoadSuccess value) loadSuccess,
    required TResult Function(ThreadStateLoadError value) loadError,
    required TResult Function(ThreadStateThreadsListIsEmpty value) threadsListIsEmpty,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ThreadStateInitial value)? initial,
    TResult Function(ThreadStateLoadSuccess value)? loadSuccess,
    TResult Function(ThreadStateLoadError value)? loadError,
    TResult Function(ThreadStateThreadsListIsEmpty value)? threadsListIsEmpty,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ThreadStateInitial implements ThreadState {
  const factory ThreadStateInitial() = _$ThreadStateInitial;
}

/// @nodoc
abstract class $ThreadStateLoadSuccessCopyWith<$Res> {
  factory $ThreadStateLoadSuccessCopyWith(ThreadStateLoadSuccess value, $Res Function(ThreadStateLoadSuccess) then) =
      _$ThreadStateLoadSuccessCopyWithImpl<$Res>;

  $Res call({List<Post> posts});
}

/// @nodoc
class _$ThreadStateLoadSuccessCopyWithImpl<$Res> extends _$ThreadStateCopyWithImpl<$Res>
    implements $ThreadStateLoadSuccessCopyWith<$Res> {
  _$ThreadStateLoadSuccessCopyWithImpl(ThreadStateLoadSuccess _value, $Res Function(ThreadStateLoadSuccess) _then)
      : super(_value, (v) => _then(v as ThreadStateLoadSuccess));

  @override
  ThreadStateLoadSuccess get _value => super._value as ThreadStateLoadSuccess;

  @override
  $Res call({
    Object? posts = freezed,
  }) {
    return _then(ThreadStateLoadSuccess(
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ));
  }
}

/// @nodoc
class _$ThreadStateLoadSuccess implements ThreadStateLoadSuccess {
  const _$ThreadStateLoadSuccess({required this.posts});

  @override
  final List<Post> posts;

  @override
  String toString() {
    return 'ThreadState.loadSuccess(posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ThreadStateLoadSuccess &&
            (identical(other.posts, posts) || const DeepCollectionEquality().equals(other.posts, posts)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(posts);

  @JsonKey(ignore: true)
  @override
  $ThreadStateLoadSuccessCopyWith<ThreadStateLoadSuccess> get copyWith =>
      _$ThreadStateLoadSuccessCopyWithImpl<ThreadStateLoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Post> posts) loadSuccess,
    required TResult Function() loadError,
    required TResult Function() threadsListIsEmpty,
  }) {
    return loadSuccess(posts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Post> posts)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? threadsListIsEmpty,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(posts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ThreadStateInitial value) initial,
    required TResult Function(ThreadStateLoadSuccess value) loadSuccess,
    required TResult Function(ThreadStateLoadError value) loadError,
    required TResult Function(ThreadStateThreadsListIsEmpty value) threadsListIsEmpty,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ThreadStateInitial value)? initial,
    TResult Function(ThreadStateLoadSuccess value)? loadSuccess,
    TResult Function(ThreadStateLoadError value)? loadError,
    TResult Function(ThreadStateThreadsListIsEmpty value)? threadsListIsEmpty,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class ThreadStateLoadSuccess implements ThreadState {
  const factory ThreadStateLoadSuccess({required List<Post> posts}) = _$ThreadStateLoadSuccess;

  List<Post> get posts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThreadStateLoadSuccessCopyWith<ThreadStateLoadSuccess> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreadStateLoadErrorCopyWith<$Res> {
  factory $ThreadStateLoadErrorCopyWith(ThreadStateLoadError value, $Res Function(ThreadStateLoadError) then) =
      _$ThreadStateLoadErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$ThreadStateLoadErrorCopyWithImpl<$Res> extends _$ThreadStateCopyWithImpl<$Res>
    implements $ThreadStateLoadErrorCopyWith<$Res> {
  _$ThreadStateLoadErrorCopyWithImpl(ThreadStateLoadError _value, $Res Function(ThreadStateLoadError) _then)
      : super(_value, (v) => _then(v as ThreadStateLoadError));

  @override
  ThreadStateLoadError get _value => super._value as ThreadStateLoadError;
}

/// @nodoc
class _$ThreadStateLoadError implements ThreadStateLoadError {
  const _$ThreadStateLoadError();

  @override
  String toString() {
    return 'ThreadState.loadError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ThreadStateLoadError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Post> posts) loadSuccess,
    required TResult Function() loadError,
    required TResult Function() threadsListIsEmpty,
  }) {
    return loadError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Post> posts)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? threadsListIsEmpty,
    required TResult orElse(),
  }) {
    if (loadError != null) {
      return loadError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ThreadStateInitial value) initial,
    required TResult Function(ThreadStateLoadSuccess value) loadSuccess,
    required TResult Function(ThreadStateLoadError value) loadError,
    required TResult Function(ThreadStateThreadsListIsEmpty value) threadsListIsEmpty,
  }) {
    return loadError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ThreadStateInitial value)? initial,
    TResult Function(ThreadStateLoadSuccess value)? loadSuccess,
    TResult Function(ThreadStateLoadError value)? loadError,
    TResult Function(ThreadStateThreadsListIsEmpty value)? threadsListIsEmpty,
    required TResult orElse(),
  }) {
    if (loadError != null) {
      return loadError(this);
    }
    return orElse();
  }
}

abstract class ThreadStateLoadError implements ThreadState {
  const factory ThreadStateLoadError() = _$ThreadStateLoadError;
}

/// @nodoc
abstract class $ThreadStateThreadsListIsEmptyCopyWith<$Res> {
  factory $ThreadStateThreadsListIsEmptyCopyWith(
          ThreadStateThreadsListIsEmpty value, $Res Function(ThreadStateThreadsListIsEmpty) then) =
      _$ThreadStateThreadsListIsEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class _$ThreadStateThreadsListIsEmptyCopyWithImpl<$Res> extends _$ThreadStateCopyWithImpl<$Res>
    implements $ThreadStateThreadsListIsEmptyCopyWith<$Res> {
  _$ThreadStateThreadsListIsEmptyCopyWithImpl(
      ThreadStateThreadsListIsEmpty _value, $Res Function(ThreadStateThreadsListIsEmpty) _then)
      : super(_value, (v) => _then(v as ThreadStateThreadsListIsEmpty));

  @override
  ThreadStateThreadsListIsEmpty get _value => super._value as ThreadStateThreadsListIsEmpty;
}

/// @nodoc
class _$ThreadStateThreadsListIsEmpty implements ThreadStateThreadsListIsEmpty {
  const _$ThreadStateThreadsListIsEmpty();

  @override
  String toString() {
    return 'ThreadState.threadsListIsEmpty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ThreadStateThreadsListIsEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Post> posts) loadSuccess,
    required TResult Function() loadError,
    required TResult Function() threadsListIsEmpty,
  }) {
    return threadsListIsEmpty();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Post> posts)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? threadsListIsEmpty,
    required TResult orElse(),
  }) {
    if (threadsListIsEmpty != null) {
      return threadsListIsEmpty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ThreadStateInitial value) initial,
    required TResult Function(ThreadStateLoadSuccess value) loadSuccess,
    required TResult Function(ThreadStateLoadError value) loadError,
    required TResult Function(ThreadStateThreadsListIsEmpty value) threadsListIsEmpty,
  }) {
    return threadsListIsEmpty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ThreadStateInitial value)? initial,
    TResult Function(ThreadStateLoadSuccess value)? loadSuccess,
    TResult Function(ThreadStateLoadError value)? loadError,
    TResult Function(ThreadStateThreadsListIsEmpty value)? threadsListIsEmpty,
    required TResult orElse(),
  }) {
    if (threadsListIsEmpty != null) {
      return threadsListIsEmpty(this);
    }
    return orElse();
  }
}

abstract class ThreadStateThreadsListIsEmpty implements ThreadState {
  const factory ThreadStateThreadsListIsEmpty() = _$ThreadStateThreadsListIsEmpty;
}
