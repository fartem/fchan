// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'thread_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ThreadEventTearOff {
  const _$ThreadEventTearOff();

  ThreadInitialized threadInitialized() {
    return const ThreadInitialized();
  }

  ThreadRefreshRequested threadRefreshRequested() {
    return const ThreadRefreshRequested();
  }
}

/// @nodoc
const $ThreadEvent = _$ThreadEventTearOff();

/// @nodoc
mixin _$ThreadEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() threadInitialized,
    required TResult Function() threadRefreshRequested,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? threadInitialized,
    TResult Function()? threadRefreshRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ThreadInitialized value) threadInitialized,
    required TResult Function(ThreadRefreshRequested value) threadRefreshRequested,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ThreadInitialized value)? threadInitialized,
    TResult Function(ThreadRefreshRequested value)? threadRefreshRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreadEventCopyWith<$Res> {
  factory $ThreadEventCopyWith(ThreadEvent value, $Res Function(ThreadEvent) then) = _$ThreadEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ThreadEventCopyWithImpl<$Res> implements $ThreadEventCopyWith<$Res> {
  _$ThreadEventCopyWithImpl(this._value, this._then);

  final ThreadEvent _value;

  // ignore: unused_field
  final $Res Function(ThreadEvent) _then;
}

/// @nodoc
abstract class $ThreadInitializedCopyWith<$Res> {
  factory $ThreadInitializedCopyWith(ThreadInitialized value, $Res Function(ThreadInitialized) then) =
      _$ThreadInitializedCopyWithImpl<$Res>;
}

/// @nodoc
class _$ThreadInitializedCopyWithImpl<$Res> extends _$ThreadEventCopyWithImpl<$Res>
    implements $ThreadInitializedCopyWith<$Res> {
  _$ThreadInitializedCopyWithImpl(ThreadInitialized _value, $Res Function(ThreadInitialized) _then)
      : super(_value, (v) => _then(v as ThreadInitialized));

  @override
  ThreadInitialized get _value => super._value as ThreadInitialized;
}

/// @nodoc
class _$ThreadInitialized implements ThreadInitialized {
  const _$ThreadInitialized();

  @override
  String toString() {
    return 'ThreadEvent.threadInitialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ThreadInitialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() threadInitialized,
    required TResult Function() threadRefreshRequested,
  }) {
    return threadInitialized();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? threadInitialized,
    TResult Function()? threadRefreshRequested,
    required TResult orElse(),
  }) {
    if (threadInitialized != null) {
      return threadInitialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ThreadInitialized value) threadInitialized,
    required TResult Function(ThreadRefreshRequested value) threadRefreshRequested,
  }) {
    return threadInitialized(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ThreadInitialized value)? threadInitialized,
    TResult Function(ThreadRefreshRequested value)? threadRefreshRequested,
    required TResult orElse(),
  }) {
    if (threadInitialized != null) {
      return threadInitialized(this);
    }
    return orElse();
  }
}

abstract class ThreadInitialized implements ThreadEvent {
  const factory ThreadInitialized() = _$ThreadInitialized;
}

/// @nodoc
abstract class $ThreadRefreshRequestedCopyWith<$Res> {
  factory $ThreadRefreshRequestedCopyWith(ThreadRefreshRequested value, $Res Function(ThreadRefreshRequested) then) =
      _$ThreadRefreshRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class _$ThreadRefreshRequestedCopyWithImpl<$Res> extends _$ThreadEventCopyWithImpl<$Res>
    implements $ThreadRefreshRequestedCopyWith<$Res> {
  _$ThreadRefreshRequestedCopyWithImpl(ThreadRefreshRequested _value, $Res Function(ThreadRefreshRequested) _then)
      : super(_value, (v) => _then(v as ThreadRefreshRequested));

  @override
  ThreadRefreshRequested get _value => super._value as ThreadRefreshRequested;
}

/// @nodoc
class _$ThreadRefreshRequested implements ThreadRefreshRequested {
  const _$ThreadRefreshRequested();

  @override
  String toString() {
    return 'ThreadEvent.threadRefreshRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ThreadRefreshRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() threadInitialized,
    required TResult Function() threadRefreshRequested,
  }) {
    return threadRefreshRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? threadInitialized,
    TResult Function()? threadRefreshRequested,
    required TResult orElse(),
  }) {
    if (threadRefreshRequested != null) {
      return threadRefreshRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ThreadInitialized value) threadInitialized,
    required TResult Function(ThreadRefreshRequested value) threadRefreshRequested,
  }) {
    return threadRefreshRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ThreadInitialized value)? threadInitialized,
    TResult Function(ThreadRefreshRequested value)? threadRefreshRequested,
    required TResult orElse(),
  }) {
    if (threadRefreshRequested != null) {
      return threadRefreshRequested(this);
    }
    return orElse();
  }
}

abstract class ThreadRefreshRequested implements ThreadEvent {
  const factory ThreadRefreshRequested() = _$ThreadRefreshRequested;
}
