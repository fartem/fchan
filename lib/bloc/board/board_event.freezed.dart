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

  BoardInitialized boardInitialized() {
    return const BoardInitialized();
  }

  BoardPortionRequested boardPortionRequested() {
    return const BoardPortionRequested();
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
    required TResult Function() boardInitialized,
    required TResult Function() boardPortionRequested,
    required TResult Function() boardRefreshed,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? boardInitialized,
    TResult Function()? boardPortionRequested,
    TResult Function()? boardRefreshed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BoardInitialized value) boardInitialized,
    required TResult Function(BoardPortionRequested value) boardPortionRequested,
    required TResult Function(BoardRefreshed value) boardRefreshed,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BoardInitialized value)? boardInitialized,
    TResult Function(BoardPortionRequested value)? boardPortionRequested,
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
abstract class $BoardInitializedCopyWith<$Res> {
  factory $BoardInitializedCopyWith(BoardInitialized value, $Res Function(BoardInitialized) then) =
      _$BoardInitializedCopyWithImpl<$Res>;
}

/// @nodoc
class _$BoardInitializedCopyWithImpl<$Res> extends _$BoardEventCopyWithImpl<$Res>
    implements $BoardInitializedCopyWith<$Res> {
  _$BoardInitializedCopyWithImpl(BoardInitialized _value, $Res Function(BoardInitialized) _then)
      : super(_value, (v) => _then(v as BoardInitialized));

  @override
  BoardInitialized get _value => super._value as BoardInitialized;
}

/// @nodoc
class _$BoardInitialized implements BoardInitialized {
  const _$BoardInitialized();

  @override
  String toString() {
    return 'BoardEvent.boardInitialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BoardInitialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() boardInitialized,
    required TResult Function() boardPortionRequested,
    required TResult Function() boardRefreshed,
  }) {
    return boardInitialized();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? boardInitialized,
    TResult Function()? boardPortionRequested,
    TResult Function()? boardRefreshed,
    required TResult orElse(),
  }) {
    if (boardInitialized != null) {
      return boardInitialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BoardInitialized value) boardInitialized,
    required TResult Function(BoardPortionRequested value) boardPortionRequested,
    required TResult Function(BoardRefreshed value) boardRefreshed,
  }) {
    return boardInitialized(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BoardInitialized value)? boardInitialized,
    TResult Function(BoardPortionRequested value)? boardPortionRequested,
    TResult Function(BoardRefreshed value)? boardRefreshed,
    required TResult orElse(),
  }) {
    if (boardInitialized != null) {
      return boardInitialized(this);
    }
    return orElse();
  }
}

abstract class BoardInitialized implements BoardEvent {
  const factory BoardInitialized() = _$BoardInitialized;
}

/// @nodoc
abstract class $BoardPortionRequestedCopyWith<$Res> {
  factory $BoardPortionRequestedCopyWith(BoardPortionRequested value, $Res Function(BoardPortionRequested) then) =
      _$BoardPortionRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class _$BoardPortionRequestedCopyWithImpl<$Res> extends _$BoardEventCopyWithImpl<$Res>
    implements $BoardPortionRequestedCopyWith<$Res> {
  _$BoardPortionRequestedCopyWithImpl(BoardPortionRequested _value, $Res Function(BoardPortionRequested) _then)
      : super(_value, (v) => _then(v as BoardPortionRequested));

  @override
  BoardPortionRequested get _value => super._value as BoardPortionRequested;
}

/// @nodoc
class _$BoardPortionRequested implements BoardPortionRequested {
  const _$BoardPortionRequested();

  @override
  String toString() {
    return 'BoardEvent.boardPortionRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BoardPortionRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() boardInitialized,
    required TResult Function() boardPortionRequested,
    required TResult Function() boardRefreshed,
  }) {
    return boardPortionRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? boardInitialized,
    TResult Function()? boardPortionRequested,
    TResult Function()? boardRefreshed,
    required TResult orElse(),
  }) {
    if (boardPortionRequested != null) {
      return boardPortionRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BoardInitialized value) boardInitialized,
    required TResult Function(BoardPortionRequested value) boardPortionRequested,
    required TResult Function(BoardRefreshed value) boardRefreshed,
  }) {
    return boardPortionRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BoardInitialized value)? boardInitialized,
    TResult Function(BoardPortionRequested value)? boardPortionRequested,
    TResult Function(BoardRefreshed value)? boardRefreshed,
    required TResult orElse(),
  }) {
    if (boardPortionRequested != null) {
      return boardPortionRequested(this);
    }
    return orElse();
  }
}

abstract class BoardPortionRequested implements BoardEvent {
  const factory BoardPortionRequested() = _$BoardPortionRequested;
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
class _$BoardRefreshed implements BoardRefreshed {
  const _$BoardRefreshed();

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
    required TResult Function() boardInitialized,
    required TResult Function() boardPortionRequested,
    required TResult Function() boardRefreshed,
  }) {
    return boardRefreshed();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? boardInitialized,
    TResult Function()? boardPortionRequested,
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
    required TResult Function(BoardInitialized value) boardInitialized,
    required TResult Function(BoardPortionRequested value) boardPortionRequested,
    required TResult Function(BoardRefreshed value) boardRefreshed,
  }) {
    return boardRefreshed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BoardInitialized value)? boardInitialized,
    TResult Function(BoardPortionRequested value)? boardPortionRequested,
    TResult Function(BoardRefreshed value)? boardRefreshed,
    required TResult orElse(),
  }) {
    if (boardRefreshed != null) {
      return boardRefreshed(this);
    }
    return orElse();
  }
}

abstract class BoardRefreshed implements BoardEvent {
  const factory BoardRefreshed() = _$BoardRefreshed;
}
