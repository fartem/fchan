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

  BoardEventInitialized initialized() {
    return const BoardEventInitialized();
  }

  BoardEventPortionRequested portionRequested() {
    return const BoardEventPortionRequested();
  }

  BoardEventRefreshed refreshed() {
    return const BoardEventRefreshed();
  }
}

/// @nodoc
const $BoardEvent = _$BoardEventTearOff();

/// @nodoc
mixin _$BoardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() portionRequested,
    required TResult Function() refreshed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? portionRequested,
    TResult Function()? refreshed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BoardEventInitialized value) initialized,
    required TResult Function(BoardEventPortionRequested value)
        portionRequested,
    required TResult Function(BoardEventRefreshed value) refreshed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BoardEventInitialized value)? initialized,
    TResult Function(BoardEventPortionRequested value)? portionRequested,
    TResult Function(BoardEventRefreshed value)? refreshed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardEventCopyWith<$Res> {
  factory $BoardEventCopyWith(
          BoardEvent value, $Res Function(BoardEvent) then) =
      _$BoardEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$BoardEventCopyWithImpl<$Res> implements $BoardEventCopyWith<$Res> {
  _$BoardEventCopyWithImpl(this._value, this._then);

  final BoardEvent _value;
  // ignore: unused_field
  final $Res Function(BoardEvent) _then;
}

/// @nodoc
abstract class $BoardEventInitializedCopyWith<$Res> {
  factory $BoardEventInitializedCopyWith(BoardEventInitialized value,
          $Res Function(BoardEventInitialized) then) =
      _$BoardEventInitializedCopyWithImpl<$Res>;
}

/// @nodoc
class _$BoardEventInitializedCopyWithImpl<$Res>
    extends _$BoardEventCopyWithImpl<$Res>
    implements $BoardEventInitializedCopyWith<$Res> {
  _$BoardEventInitializedCopyWithImpl(
      BoardEventInitialized _value, $Res Function(BoardEventInitialized) _then)
      : super(_value, (v) => _then(v as BoardEventInitialized));

  @override
  BoardEventInitialized get _value => super._value as BoardEventInitialized;
}

/// @nodoc
class _$BoardEventInitialized implements BoardEventInitialized {
  const _$BoardEventInitialized();

  @override
  String toString() {
    return 'BoardEvent.initialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BoardEventInitialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() portionRequested,
    required TResult Function() refreshed,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? portionRequested,
    TResult Function()? refreshed,
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
    required TResult Function(BoardEventInitialized value) initialized,
    required TResult Function(BoardEventPortionRequested value)
        portionRequested,
    required TResult Function(BoardEventRefreshed value) refreshed,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BoardEventInitialized value)? initialized,
    TResult Function(BoardEventPortionRequested value)? portionRequested,
    TResult Function(BoardEventRefreshed value)? refreshed,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class BoardEventInitialized implements BoardEvent {
  const factory BoardEventInitialized() = _$BoardEventInitialized;
}

/// @nodoc
abstract class $BoardEventPortionRequestedCopyWith<$Res> {
  factory $BoardEventPortionRequestedCopyWith(BoardEventPortionRequested value,
          $Res Function(BoardEventPortionRequested) then) =
      _$BoardEventPortionRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class _$BoardEventPortionRequestedCopyWithImpl<$Res>
    extends _$BoardEventCopyWithImpl<$Res>
    implements $BoardEventPortionRequestedCopyWith<$Res> {
  _$BoardEventPortionRequestedCopyWithImpl(BoardEventPortionRequested _value,
      $Res Function(BoardEventPortionRequested) _then)
      : super(_value, (v) => _then(v as BoardEventPortionRequested));

  @override
  BoardEventPortionRequested get _value =>
      super._value as BoardEventPortionRequested;
}

/// @nodoc
class _$BoardEventPortionRequested implements BoardEventPortionRequested {
  const _$BoardEventPortionRequested();

  @override
  String toString() {
    return 'BoardEvent.portionRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BoardEventPortionRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() portionRequested,
    required TResult Function() refreshed,
  }) {
    return portionRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? portionRequested,
    TResult Function()? refreshed,
    required TResult orElse(),
  }) {
    if (portionRequested != null) {
      return portionRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BoardEventInitialized value) initialized,
    required TResult Function(BoardEventPortionRequested value)
        portionRequested,
    required TResult Function(BoardEventRefreshed value) refreshed,
  }) {
    return portionRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BoardEventInitialized value)? initialized,
    TResult Function(BoardEventPortionRequested value)? portionRequested,
    TResult Function(BoardEventRefreshed value)? refreshed,
    required TResult orElse(),
  }) {
    if (portionRequested != null) {
      return portionRequested(this);
    }
    return orElse();
  }
}

abstract class BoardEventPortionRequested implements BoardEvent {
  const factory BoardEventPortionRequested() = _$BoardEventPortionRequested;
}

/// @nodoc
abstract class $BoardEventRefreshedCopyWith<$Res> {
  factory $BoardEventRefreshedCopyWith(
          BoardEventRefreshed value, $Res Function(BoardEventRefreshed) then) =
      _$BoardEventRefreshedCopyWithImpl<$Res>;
}

/// @nodoc
class _$BoardEventRefreshedCopyWithImpl<$Res>
    extends _$BoardEventCopyWithImpl<$Res>
    implements $BoardEventRefreshedCopyWith<$Res> {
  _$BoardEventRefreshedCopyWithImpl(
      BoardEventRefreshed _value, $Res Function(BoardEventRefreshed) _then)
      : super(_value, (v) => _then(v as BoardEventRefreshed));

  @override
  BoardEventRefreshed get _value => super._value as BoardEventRefreshed;
}

/// @nodoc
class _$BoardEventRefreshed implements BoardEventRefreshed {
  const _$BoardEventRefreshed();

  @override
  String toString() {
    return 'BoardEvent.refreshed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BoardEventRefreshed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() portionRequested,
    required TResult Function() refreshed,
  }) {
    return refreshed();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? portionRequested,
    TResult Function()? refreshed,
    required TResult orElse(),
  }) {
    if (refreshed != null) {
      return refreshed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BoardEventInitialized value) initialized,
    required TResult Function(BoardEventPortionRequested value)
        portionRequested,
    required TResult Function(BoardEventRefreshed value) refreshed,
  }) {
    return refreshed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BoardEventInitialized value)? initialized,
    TResult Function(BoardEventPortionRequested value)? portionRequested,
    TResult Function(BoardEventRefreshed value)? refreshed,
    required TResult orElse(),
  }) {
    if (refreshed != null) {
      return refreshed(this);
    }
    return orElse();
  }
}

abstract class BoardEventRefreshed implements BoardEvent {
  const factory BoardEventRefreshed() = _$BoardEventRefreshed;
}
