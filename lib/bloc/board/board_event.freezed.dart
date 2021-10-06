// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'board_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BoardEventTearOff {
  const _$BoardEventTearOff();

  Initialized initialized() {
    return const Initialized();
  }

  ThreadPortionRequested threadsPortionRequested() {
    return const ThreadPortionRequested();
  }

  BoardRefreshed boardRefreshed() {
    return const BoardRefreshed();
  }
}

/// @nodoc
const $BoardEvent = _$BoardEventTearOff();

/// @nodoc
mixin _$BoardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() threadsPortionRequested,
    required TResult Function() boardRefreshed,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? threadsPortionRequested,
    TResult Function()? boardRefreshed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialized value) initialized,
    required TResult Function(ThreadPortionRequested value) threadsPortionRequested,
    required TResult Function(BoardRefreshed value) boardRefreshed,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
    TResult Function(ThreadPortionRequested value)? threadsPortionRequested,
    TResult Function(BoardRefreshed value)? boardRefreshed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardEventCopyWith<$Res> {
  factory $BoardEventCopyWith(BoardEvent value, $Res Function(BoardEvent) then) = _$BoardEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$BoardEventCopyWithImpl<$Res> implements $BoardEventCopyWith<$Res> {
  _$BoardEventCopyWithImpl(this._value, this._then);

  final BoardEvent _value;

  // ignore: unused_field
  final $Res Function(BoardEvent) _then;
}

/// @nodoc
abstract class $InitializedCopyWith<$Res> {
  factory $InitializedCopyWith(Initialized value, $Res Function(Initialized) then) = _$InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitializedCopyWithImpl<$Res> extends _$BoardEventCopyWithImpl<$Res> implements $InitializedCopyWith<$Res> {
  _$InitializedCopyWithImpl(Initialized _value, $Res Function(Initialized) _then)
      : super(_value, (v) => _then(v as Initialized));

  @override
  Initialized get _value => super._value as Initialized;
}

/// @nodoc
class _$Initialized extends Initialized {
  const _$Initialized() : super._();

  @override
  String toString() {
    return 'BoardEvent.initialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Initialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() threadsPortionRequested,
    required TResult Function() boardRefreshed,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? threadsPortionRequested,
    TResult Function()? boardRefreshed,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialized value) initialized,
    required TResult Function(ThreadPortionRequested value) threadsPortionRequested,
    required TResult Function(BoardRefreshed value) boardRefreshed,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
    TResult Function(ThreadPortionRequested value)? threadsPortionRequested,
    TResult Function(BoardRefreshed value)? boardRefreshed,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class Initialized extends BoardEvent {
  const factory Initialized() = _$Initialized;

  const Initialized._() : super._();
}

/// @nodoc
abstract class $ThreadPortionRequestedCopyWith<$Res> {
  factory $ThreadPortionRequestedCopyWith(ThreadPortionRequested value, $Res Function(ThreadPortionRequested) then) =
      _$ThreadPortionRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class _$ThreadPortionRequestedCopyWithImpl<$Res> extends _$BoardEventCopyWithImpl<$Res>
    implements $ThreadPortionRequestedCopyWith<$Res> {
  _$ThreadPortionRequestedCopyWithImpl(ThreadPortionRequested _value, $Res Function(ThreadPortionRequested) _then)
      : super(_value, (v) => _then(v as ThreadPortionRequested));

  @override
  ThreadPortionRequested get _value => super._value as ThreadPortionRequested;
}

/// @nodoc
class _$ThreadPortionRequested extends ThreadPortionRequested {
  const _$ThreadPortionRequested() : super._();

  @override
  String toString() {
    return 'BoardEvent.threadsPortionRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ThreadPortionRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() threadsPortionRequested,
    required TResult Function() boardRefreshed,
  }) {
    return threadsPortionRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? threadsPortionRequested,
    TResult Function()? boardRefreshed,
    required TResult orElse(),
  }) {
    if (threadsPortionRequested != null) {
      return threadsPortionRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialized value) initialized,
    required TResult Function(ThreadPortionRequested value) threadsPortionRequested,
    required TResult Function(BoardRefreshed value) boardRefreshed,
  }) {
    return threadsPortionRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
    TResult Function(ThreadPortionRequested value)? threadsPortionRequested,
    TResult Function(BoardRefreshed value)? boardRefreshed,
    required TResult orElse(),
  }) {
    if (threadsPortionRequested != null) {
      return threadsPortionRequested(this);
    }
    return orElse();
  }
}

abstract class ThreadPortionRequested extends BoardEvent {
  const factory ThreadPortionRequested() = _$ThreadPortionRequested;

  const ThreadPortionRequested._() : super._();
}

/// @nodoc
abstract class $BoardRefreshedCopyWith<$Res> {
  factory $BoardRefreshedCopyWith(BoardRefreshed value, $Res Function(BoardRefreshed) then) =
      _$BoardRefreshedCopyWithImpl<$Res>;
}

/// @nodoc
class _$BoardRefreshedCopyWithImpl<$Res> extends _$BoardEventCopyWithImpl<$Res>
    implements $BoardRefreshedCopyWith<$Res> {
  _$BoardRefreshedCopyWithImpl(BoardRefreshed _value, $Res Function(BoardRefreshed) _then)
      : super(_value, (v) => _then(v as BoardRefreshed));

  @override
  BoardRefreshed get _value => super._value as BoardRefreshed;
}

/// @nodoc
class _$BoardRefreshed extends BoardRefreshed {
  const _$BoardRefreshed() : super._();

  @override
  String toString() {
    return 'BoardEvent.boardRefreshed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BoardRefreshed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() threadsPortionRequested,
    required TResult Function() boardRefreshed,
  }) {
    return boardRefreshed();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? threadsPortionRequested,
    TResult Function()? boardRefreshed,
    required TResult orElse(),
  }) {
    if (boardRefreshed != null) {
      return boardRefreshed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialized value) initialized,
    required TResult Function(ThreadPortionRequested value) threadsPortionRequested,
    required TResult Function(BoardRefreshed value) boardRefreshed,
  }) {
    return boardRefreshed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialized value)? initialized,
    TResult Function(ThreadPortionRequested value)? threadsPortionRequested,
    TResult Function(BoardRefreshed value)? boardRefreshed,
    required TResult orElse(),
  }) {
    if (boardRefreshed != null) {
      return boardRefreshed(this);
    }
    return orElse();
  }
}

abstract class BoardRefreshed extends BoardEvent {
  const factory BoardRefreshed() = _$BoardRefreshed;

  const BoardRefreshed._() : super._();
}
