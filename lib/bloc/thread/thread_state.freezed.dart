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

  ThreadInitial threadInitial() {
    return const ThreadInitial();
  }

  ThreadLoadSuccess threadLoadSuccess({required List<Post> posts}) {
    return ThreadLoadSuccess(
      posts: posts,
    );
  }

  ThreadLoadError threadLoadError() {
    return const ThreadLoadError();
  }

  ThreadIsEmpty threadIsEmpty() {
    return const ThreadIsEmpty();
  }
}

/// @nodoc
const $ThreadState = _$ThreadStateTearOff();

/// @nodoc
mixin _$ThreadState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() threadInitial,
    required TResult Function(List<Post> posts) threadLoadSuccess,
    required TResult Function() threadLoadError,
    required TResult Function() threadIsEmpty,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? threadInitial,
    TResult Function(List<Post> posts)? threadLoadSuccess,
    TResult Function()? threadLoadError,
    TResult Function()? threadIsEmpty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ThreadInitial value) threadInitial,
    required TResult Function(ThreadLoadSuccess value) threadLoadSuccess,
    required TResult Function(ThreadLoadError value) threadLoadError,
    required TResult Function(ThreadIsEmpty value) threadIsEmpty,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ThreadInitial value)? threadInitial,
    TResult Function(ThreadLoadSuccess value)? threadLoadSuccess,
    TResult Function(ThreadLoadError value)? threadLoadError,
    TResult Function(ThreadIsEmpty value)? threadIsEmpty,
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
abstract class $ThreadInitialCopyWith<$Res> {
  factory $ThreadInitialCopyWith(ThreadInitial value, $Res Function(ThreadInitial) then) =
      _$ThreadInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$ThreadInitialCopyWithImpl<$Res> extends _$ThreadStateCopyWithImpl<$Res>
    implements $ThreadInitialCopyWith<$Res> {
  _$ThreadInitialCopyWithImpl(ThreadInitial _value, $Res Function(ThreadInitial) _then)
      : super(_value, (v) => _then(v as ThreadInitial));

  @override
  ThreadInitial get _value => super._value as ThreadInitial;
}

/// @nodoc
class _$ThreadInitial implements ThreadInitial {
  const _$ThreadInitial();

  @override
  String toString() {
    return 'ThreadState.threadInitial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ThreadInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() threadInitial,
    required TResult Function(List<Post> posts) threadLoadSuccess,
    required TResult Function() threadLoadError,
    required TResult Function() threadIsEmpty,
  }) {
    return threadInitial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? threadInitial,
    TResult Function(List<Post> posts)? threadLoadSuccess,
    TResult Function()? threadLoadError,
    TResult Function()? threadIsEmpty,
    required TResult orElse(),
  }) {
    if (threadInitial != null) {
      return threadInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ThreadInitial value) threadInitial,
    required TResult Function(ThreadLoadSuccess value) threadLoadSuccess,
    required TResult Function(ThreadLoadError value) threadLoadError,
    required TResult Function(ThreadIsEmpty value) threadIsEmpty,
  }) {
    return threadInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ThreadInitial value)? threadInitial,
    TResult Function(ThreadLoadSuccess value)? threadLoadSuccess,
    TResult Function(ThreadLoadError value)? threadLoadError,
    TResult Function(ThreadIsEmpty value)? threadIsEmpty,
    required TResult orElse(),
  }) {
    if (threadInitial != null) {
      return threadInitial(this);
    }
    return orElse();
  }
}

abstract class ThreadInitial implements ThreadState {
  const factory ThreadInitial() = _$ThreadInitial;
}

/// @nodoc
abstract class $ThreadLoadSuccessCopyWith<$Res> {
  factory $ThreadLoadSuccessCopyWith(ThreadLoadSuccess value, $Res Function(ThreadLoadSuccess) then) =
      _$ThreadLoadSuccessCopyWithImpl<$Res>;

  $Res call({List<Post> posts});
}

/// @nodoc
class _$ThreadLoadSuccessCopyWithImpl<$Res> extends _$ThreadStateCopyWithImpl<$Res>
    implements $ThreadLoadSuccessCopyWith<$Res> {
  _$ThreadLoadSuccessCopyWithImpl(ThreadLoadSuccess _value, $Res Function(ThreadLoadSuccess) _then)
      : super(_value, (v) => _then(v as ThreadLoadSuccess));

  @override
  ThreadLoadSuccess get _value => super._value as ThreadLoadSuccess;

  @override
  $Res call({
    Object? posts = freezed,
  }) {
    return _then(ThreadLoadSuccess(
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ));
  }
}

/// @nodoc
class _$ThreadLoadSuccess implements ThreadLoadSuccess {
  const _$ThreadLoadSuccess({required this.posts});

  @override
  final List<Post> posts;

  @override
  String toString() {
    return 'ThreadState.threadLoadSuccess(posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ThreadLoadSuccess &&
            (identical(other.posts, posts) || const DeepCollectionEquality().equals(other.posts, posts)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(posts);

  @JsonKey(ignore: true)
  @override
  $ThreadLoadSuccessCopyWith<ThreadLoadSuccess> get copyWith =>
      _$ThreadLoadSuccessCopyWithImpl<ThreadLoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() threadInitial,
    required TResult Function(List<Post> posts) threadLoadSuccess,
    required TResult Function() threadLoadError,
    required TResult Function() threadIsEmpty,
  }) {
    return threadLoadSuccess(posts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? threadInitial,
    TResult Function(List<Post> posts)? threadLoadSuccess,
    TResult Function()? threadLoadError,
    TResult Function()? threadIsEmpty,
    required TResult orElse(),
  }) {
    if (threadLoadSuccess != null) {
      return threadLoadSuccess(posts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ThreadInitial value) threadInitial,
    required TResult Function(ThreadLoadSuccess value) threadLoadSuccess,
    required TResult Function(ThreadLoadError value) threadLoadError,
    required TResult Function(ThreadIsEmpty value) threadIsEmpty,
  }) {
    return threadLoadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ThreadInitial value)? threadInitial,
    TResult Function(ThreadLoadSuccess value)? threadLoadSuccess,
    TResult Function(ThreadLoadError value)? threadLoadError,
    TResult Function(ThreadIsEmpty value)? threadIsEmpty,
    required TResult orElse(),
  }) {
    if (threadLoadSuccess != null) {
      return threadLoadSuccess(this);
    }
    return orElse();
  }
}

abstract class ThreadLoadSuccess implements ThreadState {
  const factory ThreadLoadSuccess({required List<Post> posts}) = _$ThreadLoadSuccess;

  List<Post> get posts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThreadLoadSuccessCopyWith<ThreadLoadSuccess> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreadLoadErrorCopyWith<$Res> {
  factory $ThreadLoadErrorCopyWith(ThreadLoadError value, $Res Function(ThreadLoadError) then) =
      _$ThreadLoadErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$ThreadLoadErrorCopyWithImpl<$Res> extends _$ThreadStateCopyWithImpl<$Res>
    implements $ThreadLoadErrorCopyWith<$Res> {
  _$ThreadLoadErrorCopyWithImpl(ThreadLoadError _value, $Res Function(ThreadLoadError) _then)
      : super(_value, (v) => _then(v as ThreadLoadError));

  @override
  ThreadLoadError get _value => super._value as ThreadLoadError;
}

/// @nodoc
class _$ThreadLoadError implements ThreadLoadError {
  const _$ThreadLoadError();

  @override
  String toString() {
    return 'ThreadState.threadLoadError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ThreadLoadError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() threadInitial,
    required TResult Function(List<Post> posts) threadLoadSuccess,
    required TResult Function() threadLoadError,
    required TResult Function() threadIsEmpty,
  }) {
    return threadLoadError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? threadInitial,
    TResult Function(List<Post> posts)? threadLoadSuccess,
    TResult Function()? threadLoadError,
    TResult Function()? threadIsEmpty,
    required TResult orElse(),
  }) {
    if (threadLoadError != null) {
      return threadLoadError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ThreadInitial value) threadInitial,
    required TResult Function(ThreadLoadSuccess value) threadLoadSuccess,
    required TResult Function(ThreadLoadError value) threadLoadError,
    required TResult Function(ThreadIsEmpty value) threadIsEmpty,
  }) {
    return threadLoadError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ThreadInitial value)? threadInitial,
    TResult Function(ThreadLoadSuccess value)? threadLoadSuccess,
    TResult Function(ThreadLoadError value)? threadLoadError,
    TResult Function(ThreadIsEmpty value)? threadIsEmpty,
    required TResult orElse(),
  }) {
    if (threadLoadError != null) {
      return threadLoadError(this);
    }
    return orElse();
  }
}

abstract class ThreadLoadError implements ThreadState {
  const factory ThreadLoadError() = _$ThreadLoadError;
}

/// @nodoc
abstract class $ThreadIsEmptyCopyWith<$Res> {
  factory $ThreadIsEmptyCopyWith(ThreadIsEmpty value, $Res Function(ThreadIsEmpty) then) =
      _$ThreadIsEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class _$ThreadIsEmptyCopyWithImpl<$Res> extends _$ThreadStateCopyWithImpl<$Res>
    implements $ThreadIsEmptyCopyWith<$Res> {
  _$ThreadIsEmptyCopyWithImpl(ThreadIsEmpty _value, $Res Function(ThreadIsEmpty) _then)
      : super(_value, (v) => _then(v as ThreadIsEmpty));

  @override
  ThreadIsEmpty get _value => super._value as ThreadIsEmpty;
}

/// @nodoc
class _$ThreadIsEmpty implements ThreadIsEmpty {
  const _$ThreadIsEmpty();

  @override
  String toString() {
    return 'ThreadState.threadIsEmpty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ThreadIsEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() threadInitial,
    required TResult Function(List<Post> posts) threadLoadSuccess,
    required TResult Function() threadLoadError,
    required TResult Function() threadIsEmpty,
  }) {
    return threadIsEmpty();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? threadInitial,
    TResult Function(List<Post> posts)? threadLoadSuccess,
    TResult Function()? threadLoadError,
    TResult Function()? threadIsEmpty,
    required TResult orElse(),
  }) {
    if (threadIsEmpty != null) {
      return threadIsEmpty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ThreadInitial value) threadInitial,
    required TResult Function(ThreadLoadSuccess value) threadLoadSuccess,
    required TResult Function(ThreadLoadError value) threadLoadError,
    required TResult Function(ThreadIsEmpty value) threadIsEmpty,
  }) {
    return threadIsEmpty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ThreadInitial value)? threadInitial,
    TResult Function(ThreadLoadSuccess value)? threadLoadSuccess,
    TResult Function(ThreadLoadError value)? threadLoadError,
    TResult Function(ThreadIsEmpty value)? threadIsEmpty,
    required TResult orElse(),
  }) {
    if (threadIsEmpty != null) {
      return threadIsEmpty(this);
    }
    return orElse();
  }
}

abstract class ThreadIsEmpty implements ThreadState {
  const factory ThreadIsEmpty() = _$ThreadIsEmpty;
}
