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

  HistoryEventUpdateRequested updateRequested() {
    return const HistoryEventUpdateRequested();
  }

  HistoryEventClearRequested clearRequested() {
    return const HistoryEventClearRequested();
  }

  HistoryEventThreadRemovedFromHistory threadRemovedFromHistory(
      {required Thread thread}) {
    return HistoryEventThreadRemovedFromHistory(
      thread: thread,
    );
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
    required TResult Function() updateRequested,
    required TResult Function() clearRequested,
    required TResult Function(Thread thread) threadRemovedFromHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? portionRequested,
    TResult Function()? updateRequested,
    TResult Function()? clearRequested,
    TResult Function(Thread thread)? threadRemovedFromHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HistoryEventInitialized value) initialized,
    required TResult Function(HistoryEventPortionRequested value)
        portionRequested,
    required TResult Function(HistoryEventUpdateRequested value)
        updateRequested,
    required TResult Function(HistoryEventClearRequested value) clearRequested,
    required TResult Function(HistoryEventThreadRemovedFromHistory value)
        threadRemovedFromHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryEventInitialized value)? initialized,
    TResult Function(HistoryEventPortionRequested value)? portionRequested,
    TResult Function(HistoryEventUpdateRequested value)? updateRequested,
    TResult Function(HistoryEventClearRequested value)? clearRequested,
    TResult Function(HistoryEventThreadRemovedFromHistory value)?
        threadRemovedFromHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryEventCopyWith<$Res> {
  factory $HistoryEventCopyWith(
          HistoryEvent value, $Res Function(HistoryEvent) then) =
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
  factory $HistoryEventInitializedCopyWith(HistoryEventInitialized value,
          $Res Function(HistoryEventInitialized) then) =
      _$HistoryEventInitializedCopyWithImpl<$Res>;
}

/// @nodoc
class _$HistoryEventInitializedCopyWithImpl<$Res>
    extends _$HistoryEventCopyWithImpl<$Res>
    implements $HistoryEventInitializedCopyWith<$Res> {
  _$HistoryEventInitializedCopyWithImpl(HistoryEventInitialized _value,
      $Res Function(HistoryEventInitialized) _then)
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
    required TResult Function() updateRequested,
    required TResult Function() clearRequested,
    required TResult Function(Thread thread) threadRemovedFromHistory,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? portionRequested,
    TResult Function()? updateRequested,
    TResult Function()? clearRequested,
    TResult Function(Thread thread)? threadRemovedFromHistory,
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
    required TResult Function(HistoryEventPortionRequested value)
        portionRequested,
    required TResult Function(HistoryEventUpdateRequested value)
        updateRequested,
    required TResult Function(HistoryEventClearRequested value) clearRequested,
    required TResult Function(HistoryEventThreadRemovedFromHistory value)
        threadRemovedFromHistory,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryEventInitialized value)? initialized,
    TResult Function(HistoryEventPortionRequested value)? portionRequested,
    TResult Function(HistoryEventUpdateRequested value)? updateRequested,
    TResult Function(HistoryEventClearRequested value)? clearRequested,
    TResult Function(HistoryEventThreadRemovedFromHistory value)?
        threadRemovedFromHistory,
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
          HistoryEventPortionRequested value,
          $Res Function(HistoryEventPortionRequested) then) =
      _$HistoryEventPortionRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class _$HistoryEventPortionRequestedCopyWithImpl<$Res>
    extends _$HistoryEventCopyWithImpl<$Res>
    implements $HistoryEventPortionRequestedCopyWith<$Res> {
  _$HistoryEventPortionRequestedCopyWithImpl(
      HistoryEventPortionRequested _value,
      $Res Function(HistoryEventPortionRequested) _then)
      : super(_value, (v) => _then(v as HistoryEventPortionRequested));

  @override
  HistoryEventPortionRequested get _value =>
      super._value as HistoryEventPortionRequested;
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
    required TResult Function() updateRequested,
    required TResult Function() clearRequested,
    required TResult Function(Thread thread) threadRemovedFromHistory,
  }) {
    return portionRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? portionRequested,
    TResult Function()? updateRequested,
    TResult Function()? clearRequested,
    TResult Function(Thread thread)? threadRemovedFromHistory,
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
    required TResult Function(HistoryEventPortionRequested value)
        portionRequested,
    required TResult Function(HistoryEventUpdateRequested value)
        updateRequested,
    required TResult Function(HistoryEventClearRequested value) clearRequested,
    required TResult Function(HistoryEventThreadRemovedFromHistory value)
        threadRemovedFromHistory,
  }) {
    return portionRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryEventInitialized value)? initialized,
    TResult Function(HistoryEventPortionRequested value)? portionRequested,
    TResult Function(HistoryEventUpdateRequested value)? updateRequested,
    TResult Function(HistoryEventClearRequested value)? clearRequested,
    TResult Function(HistoryEventThreadRemovedFromHistory value)?
        threadRemovedFromHistory,
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
abstract class $HistoryEventUpdateRequestedCopyWith<$Res> {
  factory $HistoryEventUpdateRequestedCopyWith(
          HistoryEventUpdateRequested value,
          $Res Function(HistoryEventUpdateRequested) then) =
      _$HistoryEventUpdateRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class _$HistoryEventUpdateRequestedCopyWithImpl<$Res>
    extends _$HistoryEventCopyWithImpl<$Res>
    implements $HistoryEventUpdateRequestedCopyWith<$Res> {
  _$HistoryEventUpdateRequestedCopyWithImpl(HistoryEventUpdateRequested _value,
      $Res Function(HistoryEventUpdateRequested) _then)
      : super(_value, (v) => _then(v as HistoryEventUpdateRequested));

  @override
  HistoryEventUpdateRequested get _value =>
      super._value as HistoryEventUpdateRequested;
}

/// @nodoc
class _$HistoryEventUpdateRequested implements HistoryEventUpdateRequested {
  const _$HistoryEventUpdateRequested();

  @override
  String toString() {
    return 'HistoryEvent.updateRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is HistoryEventUpdateRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() portionRequested,
    required TResult Function() updateRequested,
    required TResult Function() clearRequested,
    required TResult Function(Thread thread) threadRemovedFromHistory,
  }) {
    return updateRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? portionRequested,
    TResult Function()? updateRequested,
    TResult Function()? clearRequested,
    TResult Function(Thread thread)? threadRemovedFromHistory,
    required TResult orElse(),
  }) {
    if (updateRequested != null) {
      return updateRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HistoryEventInitialized value) initialized,
    required TResult Function(HistoryEventPortionRequested value)
        portionRequested,
    required TResult Function(HistoryEventUpdateRequested value)
        updateRequested,
    required TResult Function(HistoryEventClearRequested value) clearRequested,
    required TResult Function(HistoryEventThreadRemovedFromHistory value)
        threadRemovedFromHistory,
  }) {
    return updateRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryEventInitialized value)? initialized,
    TResult Function(HistoryEventPortionRequested value)? portionRequested,
    TResult Function(HistoryEventUpdateRequested value)? updateRequested,
    TResult Function(HistoryEventClearRequested value)? clearRequested,
    TResult Function(HistoryEventThreadRemovedFromHistory value)?
        threadRemovedFromHistory,
    required TResult orElse(),
  }) {
    if (updateRequested != null) {
      return updateRequested(this);
    }
    return orElse();
  }
}

abstract class HistoryEventUpdateRequested implements HistoryEvent {
  const factory HistoryEventUpdateRequested() = _$HistoryEventUpdateRequested;
}

/// @nodoc
abstract class $HistoryEventClearRequestedCopyWith<$Res> {
  factory $HistoryEventClearRequestedCopyWith(HistoryEventClearRequested value,
          $Res Function(HistoryEventClearRequested) then) =
      _$HistoryEventClearRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class _$HistoryEventClearRequestedCopyWithImpl<$Res>
    extends _$HistoryEventCopyWithImpl<$Res>
    implements $HistoryEventClearRequestedCopyWith<$Res> {
  _$HistoryEventClearRequestedCopyWithImpl(HistoryEventClearRequested _value,
      $Res Function(HistoryEventClearRequested) _then)
      : super(_value, (v) => _then(v as HistoryEventClearRequested));

  @override
  HistoryEventClearRequested get _value =>
      super._value as HistoryEventClearRequested;
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
    required TResult Function() updateRequested,
    required TResult Function() clearRequested,
    required TResult Function(Thread thread) threadRemovedFromHistory,
  }) {
    return clearRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? portionRequested,
    TResult Function()? updateRequested,
    TResult Function()? clearRequested,
    TResult Function(Thread thread)? threadRemovedFromHistory,
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
    required TResult Function(HistoryEventPortionRequested value)
        portionRequested,
    required TResult Function(HistoryEventUpdateRequested value)
        updateRequested,
    required TResult Function(HistoryEventClearRequested value) clearRequested,
    required TResult Function(HistoryEventThreadRemovedFromHistory value)
        threadRemovedFromHistory,
  }) {
    return clearRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryEventInitialized value)? initialized,
    TResult Function(HistoryEventPortionRequested value)? portionRequested,
    TResult Function(HistoryEventUpdateRequested value)? updateRequested,
    TResult Function(HistoryEventClearRequested value)? clearRequested,
    TResult Function(HistoryEventThreadRemovedFromHistory value)?
        threadRemovedFromHistory,
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

/// @nodoc
abstract class $HistoryEventThreadRemovedFromHistoryCopyWith<$Res> {
  factory $HistoryEventThreadRemovedFromHistoryCopyWith(
          HistoryEventThreadRemovedFromHistory value,
          $Res Function(HistoryEventThreadRemovedFromHistory) then) =
      _$HistoryEventThreadRemovedFromHistoryCopyWithImpl<$Res>;
  $Res call({Thread thread});
}

/// @nodoc
class _$HistoryEventThreadRemovedFromHistoryCopyWithImpl<$Res>
    extends _$HistoryEventCopyWithImpl<$Res>
    implements $HistoryEventThreadRemovedFromHistoryCopyWith<$Res> {
  _$HistoryEventThreadRemovedFromHistoryCopyWithImpl(
      HistoryEventThreadRemovedFromHistory _value,
      $Res Function(HistoryEventThreadRemovedFromHistory) _then)
      : super(_value, (v) => _then(v as HistoryEventThreadRemovedFromHistory));

  @override
  HistoryEventThreadRemovedFromHistory get _value =>
      super._value as HistoryEventThreadRemovedFromHistory;

  @override
  $Res call({
    Object? thread = freezed,
  }) {
    return _then(HistoryEventThreadRemovedFromHistory(
      thread: thread == freezed
          ? _value.thread
          : thread // ignore: cast_nullable_to_non_nullable
              as Thread,
    ));
  }
}

/// @nodoc
class _$HistoryEventThreadRemovedFromHistory
    implements HistoryEventThreadRemovedFromHistory {
  const _$HistoryEventThreadRemovedFromHistory({required this.thread});

  @override
  final Thread thread;

  @override
  String toString() {
    return 'HistoryEvent.threadRemovedFromHistory(thread: $thread)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HistoryEventThreadRemovedFromHistory &&
            (identical(other.thread, thread) ||
                const DeepCollectionEquality().equals(other.thread, thread)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(thread);

  @JsonKey(ignore: true)
  @override
  $HistoryEventThreadRemovedFromHistoryCopyWith<
          HistoryEventThreadRemovedFromHistory>
      get copyWith => _$HistoryEventThreadRemovedFromHistoryCopyWithImpl<
          HistoryEventThreadRemovedFromHistory>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() portionRequested,
    required TResult Function() updateRequested,
    required TResult Function() clearRequested,
    required TResult Function(Thread thread) threadRemovedFromHistory,
  }) {
    return threadRemovedFromHistory(thread);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? portionRequested,
    TResult Function()? updateRequested,
    TResult Function()? clearRequested,
    TResult Function(Thread thread)? threadRemovedFromHistory,
    required TResult orElse(),
  }) {
    if (threadRemovedFromHistory != null) {
      return threadRemovedFromHistory(thread);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HistoryEventInitialized value) initialized,
    required TResult Function(HistoryEventPortionRequested value)
        portionRequested,
    required TResult Function(HistoryEventUpdateRequested value)
        updateRequested,
    required TResult Function(HistoryEventClearRequested value) clearRequested,
    required TResult Function(HistoryEventThreadRemovedFromHistory value)
        threadRemovedFromHistory,
  }) {
    return threadRemovedFromHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryEventInitialized value)? initialized,
    TResult Function(HistoryEventPortionRequested value)? portionRequested,
    TResult Function(HistoryEventUpdateRequested value)? updateRequested,
    TResult Function(HistoryEventClearRequested value)? clearRequested,
    TResult Function(HistoryEventThreadRemovedFromHistory value)?
        threadRemovedFromHistory,
    required TResult orElse(),
  }) {
    if (threadRemovedFromHistory != null) {
      return threadRemovedFromHistory(this);
    }
    return orElse();
  }
}

abstract class HistoryEventThreadRemovedFromHistory implements HistoryEvent {
  const factory HistoryEventThreadRemovedFromHistory({required Thread thread}) =
      _$HistoryEventThreadRemovedFromHistory;

  Thread get thread => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryEventThreadRemovedFromHistoryCopyWith<
          HistoryEventThreadRemovedFromHistory>
      get copyWith => throw _privateConstructorUsedError;
}
