// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'history_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HistoryEventTearOff {
  const _$HistoryEventTearOff();

  HistoryEventInitialized initialized() {
    return const HistoryEventInitialized();
  }

  HistoryEventPortionRequested portionRequested() {
    return const HistoryEventPortionRequested();
  }

  HistoryEventClearRequested clearRequested() {
    return const HistoryEventClearRequested();
  }
}

/// @nodoc
const $HistoryEvent = _$HistoryEventTearOff();

/// @nodoc
mixin _$HistoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() portionRequested,
    required TResult Function() clearRequested,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? portionRequested,
    TResult Function()? clearRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HistoryEventInitialized value) initialized,
    required TResult Function(HistoryEventPortionRequested value) portionRequested,
    required TResult Function(HistoryEventClearRequested value) clearRequested,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryEventInitialized value)? initialized,
    TResult Function(HistoryEventPortionRequested value)? portionRequested,
    TResult Function(HistoryEventClearRequested value)? clearRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryEventCopyWith<$Res> {
  factory $HistoryEventCopyWith(HistoryEvent value, $Res Function(HistoryEvent) then) =
      _$HistoryEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HistoryEventCopyWithImpl<$Res> implements $HistoryEventCopyWith<$Res> {
  _$HistoryEventCopyWithImpl(this._value, this._then);

  final HistoryEvent _value;

  // ignore: unused_field
  final $Res Function(HistoryEvent) _then;
}

/// @nodoc
abstract class $HistoryEventInitializedCopyWith<$Res> {
  factory $HistoryEventInitializedCopyWith(HistoryEventInitialized value, $Res Function(HistoryEventInitialized) then) =
      _$HistoryEventInitializedCopyWithImpl<$Res>;
}

/// @nodoc
class _$HistoryEventInitializedCopyWithImpl<$Res> extends _$HistoryEventCopyWithImpl<$Res>
    implements $HistoryEventInitializedCopyWith<$Res> {
  _$HistoryEventInitializedCopyWithImpl(HistoryEventInitialized _value, $Res Function(HistoryEventInitialized) _then)
      : super(_value, (v) => _then(v as HistoryEventInitialized));

  @override
  HistoryEventInitialized get _value => super._value as HistoryEventInitialized;
}

/// @nodoc
class _$HistoryEventInitialized implements HistoryEventInitialized {
  const _$HistoryEventInitialized();

  @override
  String toString() {
    return 'HistoryEvent.initialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is HistoryEventInitialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() portionRequested,
    required TResult Function() clearRequested,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? portionRequested,
    TResult Function()? clearRequested,
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
    required TResult Function(HistoryEventInitialized value) initialized,
    required TResult Function(HistoryEventPortionRequested value) portionRequested,
    required TResult Function(HistoryEventClearRequested value) clearRequested,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryEventInitialized value)? initialized,
    TResult Function(HistoryEventPortionRequested value)? portionRequested,
    TResult Function(HistoryEventClearRequested value)? clearRequested,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class HistoryEventInitialized implements HistoryEvent {
  const factory HistoryEventInitialized() = _$HistoryEventInitialized;
}

/// @nodoc
abstract class $HistoryEventPortionRequestedCopyWith<$Res> {
  factory $HistoryEventPortionRequestedCopyWith(
          HistoryEventPortionRequested value, $Res Function(HistoryEventPortionRequested) then) =
      _$HistoryEventPortionRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class _$HistoryEventPortionRequestedCopyWithImpl<$Res> extends _$HistoryEventCopyWithImpl<$Res>
    implements $HistoryEventPortionRequestedCopyWith<$Res> {
  _$HistoryEventPortionRequestedCopyWithImpl(
      HistoryEventPortionRequested _value, $Res Function(HistoryEventPortionRequested) _then)
      : super(_value, (v) => _then(v as HistoryEventPortionRequested));

  @override
  HistoryEventPortionRequested get _value => super._value as HistoryEventPortionRequested;
}

/// @nodoc
class _$HistoryEventPortionRequested implements HistoryEventPortionRequested {
  const _$HistoryEventPortionRequested();

  @override
  String toString() {
    return 'HistoryEvent.portionRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is HistoryEventPortionRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() portionRequested,
    required TResult Function() clearRequested,
  }) {
    return portionRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? portionRequested,
    TResult Function()? clearRequested,
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
    required TResult Function(HistoryEventInitialized value) initialized,
    required TResult Function(HistoryEventPortionRequested value) portionRequested,
    required TResult Function(HistoryEventClearRequested value) clearRequested,
  }) {
    return portionRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryEventInitialized value)? initialized,
    TResult Function(HistoryEventPortionRequested value)? portionRequested,
    TResult Function(HistoryEventClearRequested value)? clearRequested,
    required TResult orElse(),
  }) {
    if (portionRequested != null) {
      return portionRequested(this);
    }
    return orElse();
  }
}

abstract class HistoryEventPortionRequested implements HistoryEvent {
  const factory HistoryEventPortionRequested() = _$HistoryEventPortionRequested;
}

/// @nodoc
abstract class $HistoryEventClearRequestedCopyWith<$Res> {
  factory $HistoryEventClearRequestedCopyWith(
          HistoryEventClearRequested value, $Res Function(HistoryEventClearRequested) then) =
      _$HistoryEventClearRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class _$HistoryEventClearRequestedCopyWithImpl<$Res> extends _$HistoryEventCopyWithImpl<$Res>
    implements $HistoryEventClearRequestedCopyWith<$Res> {
  _$HistoryEventClearRequestedCopyWithImpl(
      HistoryEventClearRequested _value, $Res Function(HistoryEventClearRequested) _then)
      : super(_value, (v) => _then(v as HistoryEventClearRequested));

  @override
  HistoryEventClearRequested get _value => super._value as HistoryEventClearRequested;
}

/// @nodoc
class _$HistoryEventClearRequested implements HistoryEventClearRequested {
  const _$HistoryEventClearRequested();

  @override
  String toString() {
    return 'HistoryEvent.clearRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is HistoryEventClearRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() portionRequested,
    required TResult Function() clearRequested,
  }) {
    return clearRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? portionRequested,
    TResult Function()? clearRequested,
    required TResult orElse(),
  }) {
    if (clearRequested != null) {
      return clearRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HistoryEventInitialized value) initialized,
    required TResult Function(HistoryEventPortionRequested value) portionRequested,
    required TResult Function(HistoryEventClearRequested value) clearRequested,
  }) {
    return clearRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryEventInitialized value)? initialized,
    TResult Function(HistoryEventPortionRequested value)? portionRequested,
    TResult Function(HistoryEventClearRequested value)? clearRequested,
    required TResult orElse(),
  }) {
    if (clearRequested != null) {
      return clearRequested(this);
    }
    return orElse();
  }
}

abstract class HistoryEventClearRequested implements HistoryEvent {
  const factory HistoryEventClearRequested() = _$HistoryEventClearRequested;
}
