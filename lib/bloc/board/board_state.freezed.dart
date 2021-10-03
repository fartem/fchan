// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'board_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BoardStateTearOff {
  const _$BoardStateTearOff();

  Initial initial() {
    return const Initial();
  }

  ThreadsLoadSuccess threadsLoadSuccess({required List<ListEntity> threads}) {
    return ThreadsLoadSuccess(
      threads: threads,
    );
  }

  ThreadsLoadError threadsLoadError() {
    return const ThreadsLoadError();
  }
}

/// @nodoc
const $BoardState = _$BoardStateTearOff();

/// @nodoc
mixin _$BoardState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ListEntity> threads) threadsLoadSuccess,
    required TResult Function() threadsLoadError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ListEntity> threads)? threadsLoadSuccess,
    TResult Function()? threadsLoadError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(ThreadsLoadSuccess value) threadsLoadSuccess,
    required TResult Function(ThreadsLoadError value) threadsLoadError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(ThreadsLoadSuccess value)? threadsLoadSuccess,
    TResult Function(ThreadsLoadError value)? threadsLoadError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardStateCopyWith<$Res> {
  factory $BoardStateCopyWith(
          BoardState value, $Res Function(BoardState) then) =
      _$BoardStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$BoardStateCopyWithImpl<$Res> implements $BoardStateCopyWith<$Res> {
  _$BoardStateCopyWithImpl(this._value, this._then);

  final BoardState _value;
  // ignore: unused_field
  final $Res Function(BoardState) _then;
}

/// @nodoc
abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> extends _$BoardStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

/// @nodoc
class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'BoardState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ListEntity> threads) threadsLoadSuccess,
    required TResult Function() threadsLoadError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ListEntity> threads)? threadsLoadSuccess,
    TResult Function()? threadsLoadError,
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
    required TResult Function(Initial value) initial,
    required TResult Function(ThreadsLoadSuccess value) threadsLoadSuccess,
    required TResult Function(ThreadsLoadError value) threadsLoadError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(ThreadsLoadSuccess value)? threadsLoadSuccess,
    TResult Function(ThreadsLoadError value)? threadsLoadError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements BoardState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class $ThreadsLoadSuccessCopyWith<$Res> {
  factory $ThreadsLoadSuccessCopyWith(
          ThreadsLoadSuccess value, $Res Function(ThreadsLoadSuccess) then) =
      _$ThreadsLoadSuccessCopyWithImpl<$Res>;
  $Res call({List<ListEntity> threads});
}

/// @nodoc
class _$ThreadsLoadSuccessCopyWithImpl<$Res>
    extends _$BoardStateCopyWithImpl<$Res>
    implements $ThreadsLoadSuccessCopyWith<$Res> {
  _$ThreadsLoadSuccessCopyWithImpl(
      ThreadsLoadSuccess _value, $Res Function(ThreadsLoadSuccess) _then)
      : super(_value, (v) => _then(v as ThreadsLoadSuccess));

  @override
  ThreadsLoadSuccess get _value => super._value as ThreadsLoadSuccess;

  @override
  $Res call({
    Object? threads = freezed,
  }) {
    return _then(ThreadsLoadSuccess(
      threads: threads == freezed
          ? _value.threads
          : threads // ignore: cast_nullable_to_non_nullable
              as List<ListEntity>,
    ));
  }
}

/// @nodoc
class _$ThreadsLoadSuccess implements ThreadsLoadSuccess {
  const _$ThreadsLoadSuccess({required this.threads});

  @override
  final List<ListEntity> threads;

  @override
  String toString() {
    return 'BoardState.threadsLoadSuccess(threads: $threads)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ThreadsLoadSuccess &&
            (identical(other.threads, threads) ||
                const DeepCollectionEquality().equals(other.threads, threads)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(threads);

  @JsonKey(ignore: true)
  @override
  $ThreadsLoadSuccessCopyWith<ThreadsLoadSuccess> get copyWith =>
      _$ThreadsLoadSuccessCopyWithImpl<ThreadsLoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ListEntity> threads) threadsLoadSuccess,
    required TResult Function() threadsLoadError,
  }) {
    return threadsLoadSuccess(threads);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ListEntity> threads)? threadsLoadSuccess,
    TResult Function()? threadsLoadError,
    required TResult orElse(),
  }) {
    if (threadsLoadSuccess != null) {
      return threadsLoadSuccess(threads);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(ThreadsLoadSuccess value) threadsLoadSuccess,
    required TResult Function(ThreadsLoadError value) threadsLoadError,
  }) {
    return threadsLoadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(ThreadsLoadSuccess value)? threadsLoadSuccess,
    TResult Function(ThreadsLoadError value)? threadsLoadError,
    required TResult orElse(),
  }) {
    if (threadsLoadSuccess != null) {
      return threadsLoadSuccess(this);
    }
    return orElse();
  }
}

abstract class ThreadsLoadSuccess implements BoardState {
  const factory ThreadsLoadSuccess({required List<ListEntity> threads}) =
      _$ThreadsLoadSuccess;

  List<ListEntity> get threads => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThreadsLoadSuccessCopyWith<ThreadsLoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreadsLoadErrorCopyWith<$Res> {
  factory $ThreadsLoadErrorCopyWith(
          ThreadsLoadError value, $Res Function(ThreadsLoadError) then) =
      _$ThreadsLoadErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$ThreadsLoadErrorCopyWithImpl<$Res>
    extends _$BoardStateCopyWithImpl<$Res>
    implements $ThreadsLoadErrorCopyWith<$Res> {
  _$ThreadsLoadErrorCopyWithImpl(
      ThreadsLoadError _value, $Res Function(ThreadsLoadError) _then)
      : super(_value, (v) => _then(v as ThreadsLoadError));

  @override
  ThreadsLoadError get _value => super._value as ThreadsLoadError;
}

/// @nodoc
class _$ThreadsLoadError implements ThreadsLoadError {
  const _$ThreadsLoadError();

  @override
  String toString() {
    return 'BoardState.threadsLoadError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ThreadsLoadError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ListEntity> threads) threadsLoadSuccess,
    required TResult Function() threadsLoadError,
  }) {
    return threadsLoadError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ListEntity> threads)? threadsLoadSuccess,
    TResult Function()? threadsLoadError,
    required TResult orElse(),
  }) {
    if (threadsLoadError != null) {
      return threadsLoadError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(ThreadsLoadSuccess value) threadsLoadSuccess,
    required TResult Function(ThreadsLoadError value) threadsLoadError,
  }) {
    return threadsLoadError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(ThreadsLoadSuccess value)? threadsLoadSuccess,
    TResult Function(ThreadsLoadError value)? threadsLoadError,
    required TResult orElse(),
  }) {
    if (threadsLoadError != null) {
      return threadsLoadError(this);
    }
    return orElse();
  }
}

abstract class ThreadsLoadError implements BoardState {
  const factory ThreadsLoadError() = _$ThreadsLoadError;
}
