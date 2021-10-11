// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HistoryStateTearOff {
  const _$HistoryStateTearOff();

  HistoryStateInitial initial() {
    return const HistoryStateInitial();
  }

  HistoryStateLoadSuccess loadSuccess({required List<Thread> threads, required bool isLastPage}) {
    return HistoryStateLoadSuccess(
      threads: threads,
      isLastPage: isLastPage,
    );
  }

  HistoryStateLoadError loadError() {
    return const HistoryStateLoadError();
  }

  HistoryStateHistoryIsEmpty historyIsEmpty() {
    return const HistoryStateHistoryIsEmpty();
  }

  HistoryStateClearInProgress clearInProgress() {
    return const HistoryStateClearInProgress();
  }
}

/// @nodoc
const $HistoryState = _$HistoryStateTearOff();

/// @nodoc
mixin _$HistoryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Thread> threads, bool isLastPage) loadSuccess,
    required TResult Function() loadError,
    required TResult Function() historyIsEmpty,
    required TResult Function() clearInProgress,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Thread> threads, bool isLastPage)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? historyIsEmpty,
    TResult Function()? clearInProgress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HistoryStateInitial value) initial,
    required TResult Function(HistoryStateLoadSuccess value) loadSuccess,
    required TResult Function(HistoryStateLoadError value) loadError,
    required TResult Function(HistoryStateHistoryIsEmpty value) historyIsEmpty,
    required TResult Function(HistoryStateClearInProgress value) clearInProgress,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryStateInitial value)? initial,
    TResult Function(HistoryStateLoadSuccess value)? loadSuccess,
    TResult Function(HistoryStateLoadError value)? loadError,
    TResult Function(HistoryStateHistoryIsEmpty value)? historyIsEmpty,
    TResult Function(HistoryStateClearInProgress value)? clearInProgress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryStateCopyWith<$Res> {
  factory $HistoryStateCopyWith(HistoryState value, $Res Function(HistoryState) then) =
      _$HistoryStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$HistoryStateCopyWithImpl<$Res> implements $HistoryStateCopyWith<$Res> {
  _$HistoryStateCopyWithImpl(this._value, this._then);

  final HistoryState _value;

  // ignore: unused_field
  final $Res Function(HistoryState) _then;
}

/// @nodoc
abstract class $HistoryStateInitialCopyWith<$Res> {
  factory $HistoryStateInitialCopyWith(HistoryStateInitial value, $Res Function(HistoryStateInitial) then) =
      _$HistoryStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$HistoryStateInitialCopyWithImpl<$Res> extends _$HistoryStateCopyWithImpl<$Res>
    implements $HistoryStateInitialCopyWith<$Res> {
  _$HistoryStateInitialCopyWithImpl(HistoryStateInitial _value, $Res Function(HistoryStateInitial) _then)
      : super(_value, (v) => _then(v as HistoryStateInitial));

  @override
  HistoryStateInitial get _value => super._value as HistoryStateInitial;
}

/// @nodoc
class _$HistoryStateInitial implements HistoryStateInitial {
  const _$HistoryStateInitial();

  @override
  String toString() {
    return 'HistoryState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is HistoryStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Thread> threads, bool isLastPage) loadSuccess,
    required TResult Function() loadError,
    required TResult Function() historyIsEmpty,
    required TResult Function() clearInProgress,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Thread> threads, bool isLastPage)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? historyIsEmpty,
    TResult Function()? clearInProgress,
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
    required TResult Function(HistoryStateInitial value) initial,
    required TResult Function(HistoryStateLoadSuccess value) loadSuccess,
    required TResult Function(HistoryStateLoadError value) loadError,
    required TResult Function(HistoryStateHistoryIsEmpty value) historyIsEmpty,
    required TResult Function(HistoryStateClearInProgress value) clearInProgress,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryStateInitial value)? initial,
    TResult Function(HistoryStateLoadSuccess value)? loadSuccess,
    TResult Function(HistoryStateLoadError value)? loadError,
    TResult Function(HistoryStateHistoryIsEmpty value)? historyIsEmpty,
    TResult Function(HistoryStateClearInProgress value)? clearInProgress,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class HistoryStateInitial implements HistoryState {
  const factory HistoryStateInitial() = _$HistoryStateInitial;
}

/// @nodoc
abstract class $HistoryStateLoadSuccessCopyWith<$Res> {
  factory $HistoryStateLoadSuccessCopyWith(HistoryStateLoadSuccess value, $Res Function(HistoryStateLoadSuccess) then) =
      _$HistoryStateLoadSuccessCopyWithImpl<$Res>;

  $Res call({List<Thread> threads, bool isLastPage});
}

/// @nodoc
class _$HistoryStateLoadSuccessCopyWithImpl<$Res> extends _$HistoryStateCopyWithImpl<$Res>
    implements $HistoryStateLoadSuccessCopyWith<$Res> {
  _$HistoryStateLoadSuccessCopyWithImpl(HistoryStateLoadSuccess _value, $Res Function(HistoryStateLoadSuccess) _then)
      : super(_value, (v) => _then(v as HistoryStateLoadSuccess));

  @override
  HistoryStateLoadSuccess get _value => super._value as HistoryStateLoadSuccess;

  @override
  $Res call({
    Object? threads = freezed,
    Object? isLastPage = freezed,
  }) {
    return _then(HistoryStateLoadSuccess(
      threads: threads == freezed
          ? _value.threads
          : threads // ignore: cast_nullable_to_non_nullable
              as List<Thread>,
      isLastPage: isLastPage == freezed
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
class _$HistoryStateLoadSuccess implements HistoryStateLoadSuccess {
  const _$HistoryStateLoadSuccess({required this.threads, required this.isLastPage});

  @override
  final List<Thread> threads;
  @override
  final bool isLastPage;

  @override
  String toString() {
    return 'HistoryState.loadSuccess(threads: $threads, isLastPage: $isLastPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HistoryStateLoadSuccess &&
            (identical(other.threads, threads) || const DeepCollectionEquality().equals(other.threads, threads)) &&
            (identical(other.isLastPage, isLastPage) ||
                const DeepCollectionEquality().equals(other.isLastPage, isLastPage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(threads) ^
      const DeepCollectionEquality().hash(isLastPage);

  @JsonKey(ignore: true)
  @override
  $HistoryStateLoadSuccessCopyWith<HistoryStateLoadSuccess> get copyWith =>
      _$HistoryStateLoadSuccessCopyWithImpl<HistoryStateLoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Thread> threads, bool isLastPage) loadSuccess,
    required TResult Function() loadError,
    required TResult Function() historyIsEmpty,
    required TResult Function() clearInProgress,
  }) {
    return loadSuccess(threads, isLastPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Thread> threads, bool isLastPage)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? historyIsEmpty,
    TResult Function()? clearInProgress,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(threads, isLastPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HistoryStateInitial value) initial,
    required TResult Function(HistoryStateLoadSuccess value) loadSuccess,
    required TResult Function(HistoryStateLoadError value) loadError,
    required TResult Function(HistoryStateHistoryIsEmpty value) historyIsEmpty,
    required TResult Function(HistoryStateClearInProgress value) clearInProgress,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryStateInitial value)? initial,
    TResult Function(HistoryStateLoadSuccess value)? loadSuccess,
    TResult Function(HistoryStateLoadError value)? loadError,
    TResult Function(HistoryStateHistoryIsEmpty value)? historyIsEmpty,
    TResult Function(HistoryStateClearInProgress value)? clearInProgress,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class HistoryStateLoadSuccess implements HistoryState {
  const factory HistoryStateLoadSuccess({required List<Thread> threads, required bool isLastPage}) =
      _$HistoryStateLoadSuccess;

  List<Thread> get threads => throw _privateConstructorUsedError;

  bool get isLastPage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryStateLoadSuccessCopyWith<HistoryStateLoadSuccess> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryStateLoadErrorCopyWith<$Res> {
  factory $HistoryStateLoadErrorCopyWith(HistoryStateLoadError value, $Res Function(HistoryStateLoadError) then) =
      _$HistoryStateLoadErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$HistoryStateLoadErrorCopyWithImpl<$Res> extends _$HistoryStateCopyWithImpl<$Res>
    implements $HistoryStateLoadErrorCopyWith<$Res> {
  _$HistoryStateLoadErrorCopyWithImpl(HistoryStateLoadError _value, $Res Function(HistoryStateLoadError) _then)
      : super(_value, (v) => _then(v as HistoryStateLoadError));

  @override
  HistoryStateLoadError get _value => super._value as HistoryStateLoadError;
}

/// @nodoc
class _$HistoryStateLoadError implements HistoryStateLoadError {
  const _$HistoryStateLoadError();

  @override
  String toString() {
    return 'HistoryState.loadError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is HistoryStateLoadError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Thread> threads, bool isLastPage) loadSuccess,
    required TResult Function() loadError,
    required TResult Function() historyIsEmpty,
    required TResult Function() clearInProgress,
  }) {
    return loadError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Thread> threads, bool isLastPage)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? historyIsEmpty,
    TResult Function()? clearInProgress,
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
    required TResult Function(HistoryStateInitial value) initial,
    required TResult Function(HistoryStateLoadSuccess value) loadSuccess,
    required TResult Function(HistoryStateLoadError value) loadError,
    required TResult Function(HistoryStateHistoryIsEmpty value) historyIsEmpty,
    required TResult Function(HistoryStateClearInProgress value) clearInProgress,
  }) {
    return loadError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryStateInitial value)? initial,
    TResult Function(HistoryStateLoadSuccess value)? loadSuccess,
    TResult Function(HistoryStateLoadError value)? loadError,
    TResult Function(HistoryStateHistoryIsEmpty value)? historyIsEmpty,
    TResult Function(HistoryStateClearInProgress value)? clearInProgress,
    required TResult orElse(),
  }) {
    if (loadError != null) {
      return loadError(this);
    }
    return orElse();
  }
}

abstract class HistoryStateLoadError implements HistoryState {
  const factory HistoryStateLoadError() = _$HistoryStateLoadError;
}

/// @nodoc
abstract class $HistoryStateHistoryIsEmptyCopyWith<$Res> {
  factory $HistoryStateHistoryIsEmptyCopyWith(
          HistoryStateHistoryIsEmpty value, $Res Function(HistoryStateHistoryIsEmpty) then) =
      _$HistoryStateHistoryIsEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class _$HistoryStateHistoryIsEmptyCopyWithImpl<$Res> extends _$HistoryStateCopyWithImpl<$Res>
    implements $HistoryStateHistoryIsEmptyCopyWith<$Res> {
  _$HistoryStateHistoryIsEmptyCopyWithImpl(
      HistoryStateHistoryIsEmpty _value, $Res Function(HistoryStateHistoryIsEmpty) _then)
      : super(_value, (v) => _then(v as HistoryStateHistoryIsEmpty));

  @override
  HistoryStateHistoryIsEmpty get _value => super._value as HistoryStateHistoryIsEmpty;
}

/// @nodoc
class _$HistoryStateHistoryIsEmpty implements HistoryStateHistoryIsEmpty {
  const _$HistoryStateHistoryIsEmpty();

  @override
  String toString() {
    return 'HistoryState.historyIsEmpty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is HistoryStateHistoryIsEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Thread> threads, bool isLastPage) loadSuccess,
    required TResult Function() loadError,
    required TResult Function() historyIsEmpty,
    required TResult Function() clearInProgress,
  }) {
    return historyIsEmpty();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Thread> threads, bool isLastPage)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? historyIsEmpty,
    TResult Function()? clearInProgress,
    required TResult orElse(),
  }) {
    if (historyIsEmpty != null) {
      return historyIsEmpty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HistoryStateInitial value) initial,
    required TResult Function(HistoryStateLoadSuccess value) loadSuccess,
    required TResult Function(HistoryStateLoadError value) loadError,
    required TResult Function(HistoryStateHistoryIsEmpty value) historyIsEmpty,
    required TResult Function(HistoryStateClearInProgress value) clearInProgress,
  }) {
    return historyIsEmpty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryStateInitial value)? initial,
    TResult Function(HistoryStateLoadSuccess value)? loadSuccess,
    TResult Function(HistoryStateLoadError value)? loadError,
    TResult Function(HistoryStateHistoryIsEmpty value)? historyIsEmpty,
    TResult Function(HistoryStateClearInProgress value)? clearInProgress,
    required TResult orElse(),
  }) {
    if (historyIsEmpty != null) {
      return historyIsEmpty(this);
    }
    return orElse();
  }
}

abstract class HistoryStateHistoryIsEmpty implements HistoryState {
  const factory HistoryStateHistoryIsEmpty() = _$HistoryStateHistoryIsEmpty;
}

/// @nodoc
abstract class $HistoryStateClearInProgressCopyWith<$Res> {
  factory $HistoryStateClearInProgressCopyWith(
          HistoryStateClearInProgress value, $Res Function(HistoryStateClearInProgress) then) =
      _$HistoryStateClearInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class _$HistoryStateClearInProgressCopyWithImpl<$Res> extends _$HistoryStateCopyWithImpl<$Res>
    implements $HistoryStateClearInProgressCopyWith<$Res> {
  _$HistoryStateClearInProgressCopyWithImpl(
      HistoryStateClearInProgress _value, $Res Function(HistoryStateClearInProgress) _then)
      : super(_value, (v) => _then(v as HistoryStateClearInProgress));

  @override
  HistoryStateClearInProgress get _value => super._value as HistoryStateClearInProgress;
}

/// @nodoc
class _$HistoryStateClearInProgress implements HistoryStateClearInProgress {
  const _$HistoryStateClearInProgress();

  @override
  String toString() {
    return 'HistoryState.clearInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is HistoryStateClearInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Thread> threads, bool isLastPage) loadSuccess,
    required TResult Function() loadError,
    required TResult Function() historyIsEmpty,
    required TResult Function() clearInProgress,
  }) {
    return clearInProgress();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Thread> threads, bool isLastPage)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? historyIsEmpty,
    TResult Function()? clearInProgress,
    required TResult orElse(),
  }) {
    if (clearInProgress != null) {
      return clearInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HistoryStateInitial value) initial,
    required TResult Function(HistoryStateLoadSuccess value) loadSuccess,
    required TResult Function(HistoryStateLoadError value) loadError,
    required TResult Function(HistoryStateHistoryIsEmpty value) historyIsEmpty,
    required TResult Function(HistoryStateClearInProgress value) clearInProgress,
  }) {
    return clearInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryStateInitial value)? initial,
    TResult Function(HistoryStateLoadSuccess value)? loadSuccess,
    TResult Function(HistoryStateLoadError value)? loadError,
    TResult Function(HistoryStateHistoryIsEmpty value)? historyIsEmpty,
    TResult Function(HistoryStateClearInProgress value)? clearInProgress,
    required TResult orElse(),
  }) {
    if (clearInProgress != null) {
      return clearInProgress(this);
    }
    return orElse();
  }
}

abstract class HistoryStateClearInProgress implements HistoryState {
  const factory HistoryStateClearInProgress() = _$HistoryStateClearInProgress;
}
