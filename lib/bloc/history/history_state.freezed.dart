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

  HistoryInitial historyInitial() {
    return const HistoryInitial();
  }

  HistoryLoadSuccess historyLoadSuccess(
      {required List<Thread> threads, required bool isLastPage}) {
    return HistoryLoadSuccess(
      threads: threads,
      isLastPage: isLastPage,
    );
  }

  HistoryLoadError historyLoadError() {
    return const HistoryLoadError();
  }

  HistoryIsEmpty historyIsEmpty() {
    return const HistoryIsEmpty();
  }

  HistoryClearInProgress historyClearInProgress() {
    return const HistoryClearInProgress();
  }
}

/// @nodoc
const $HistoryState = _$HistoryStateTearOff();

/// @nodoc
mixin _$HistoryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() historyInitial,
    required TResult Function(List<Thread> threads, bool isLastPage)
        historyLoadSuccess,
    required TResult Function() historyLoadError,
    required TResult Function() historyIsEmpty,
    required TResult Function() historyClearInProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? historyInitial,
    TResult Function(List<Thread> threads, bool isLastPage)? historyLoadSuccess,
    TResult Function()? historyLoadError,
    TResult Function()? historyIsEmpty,
    TResult Function()? historyClearInProgress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HistoryInitial value) historyInitial,
    required TResult Function(HistoryLoadSuccess value) historyLoadSuccess,
    required TResult Function(HistoryLoadError value) historyLoadError,
    required TResult Function(HistoryIsEmpty value) historyIsEmpty,
    required TResult Function(HistoryClearInProgress value)
        historyClearInProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryInitial value)? historyInitial,
    TResult Function(HistoryLoadSuccess value)? historyLoadSuccess,
    TResult Function(HistoryLoadError value)? historyLoadError,
    TResult Function(HistoryIsEmpty value)? historyIsEmpty,
    TResult Function(HistoryClearInProgress value)? historyClearInProgress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryStateCopyWith<$Res> {
  factory $HistoryStateCopyWith(
          HistoryState value, $Res Function(HistoryState) then) =
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
abstract class $HistoryInitialCopyWith<$Res> {
  factory $HistoryInitialCopyWith(
          HistoryInitial value, $Res Function(HistoryInitial) then) =
      _$HistoryInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$HistoryInitialCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res>
    implements $HistoryInitialCopyWith<$Res> {
  _$HistoryInitialCopyWithImpl(
      HistoryInitial _value, $Res Function(HistoryInitial) _then)
      : super(_value, (v) => _then(v as HistoryInitial));

  @override
  HistoryInitial get _value => super._value as HistoryInitial;
}

/// @nodoc
class _$HistoryInitial implements HistoryInitial {
  const _$HistoryInitial();

  @override
  String toString() {
    return 'HistoryState.historyInitial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is HistoryInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() historyInitial,
    required TResult Function(List<Thread> threads, bool isLastPage)
        historyLoadSuccess,
    required TResult Function() historyLoadError,
    required TResult Function() historyIsEmpty,
    required TResult Function() historyClearInProgress,
  }) {
    return historyInitial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? historyInitial,
    TResult Function(List<Thread> threads, bool isLastPage)? historyLoadSuccess,
    TResult Function()? historyLoadError,
    TResult Function()? historyIsEmpty,
    TResult Function()? historyClearInProgress,
    required TResult orElse(),
  }) {
    if (historyInitial != null) {
      return historyInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HistoryInitial value) historyInitial,
    required TResult Function(HistoryLoadSuccess value) historyLoadSuccess,
    required TResult Function(HistoryLoadError value) historyLoadError,
    required TResult Function(HistoryIsEmpty value) historyIsEmpty,
    required TResult Function(HistoryClearInProgress value)
        historyClearInProgress,
  }) {
    return historyInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryInitial value)? historyInitial,
    TResult Function(HistoryLoadSuccess value)? historyLoadSuccess,
    TResult Function(HistoryLoadError value)? historyLoadError,
    TResult Function(HistoryIsEmpty value)? historyIsEmpty,
    TResult Function(HistoryClearInProgress value)? historyClearInProgress,
    required TResult orElse(),
  }) {
    if (historyInitial != null) {
      return historyInitial(this);
    }
    return orElse();
  }
}

abstract class HistoryInitial implements HistoryState {
  const factory HistoryInitial() = _$HistoryInitial;
}

/// @nodoc
abstract class $HistoryLoadSuccessCopyWith<$Res> {
  factory $HistoryLoadSuccessCopyWith(
          HistoryLoadSuccess value, $Res Function(HistoryLoadSuccess) then) =
      _$HistoryLoadSuccessCopyWithImpl<$Res>;
  $Res call({List<Thread> threads, bool isLastPage});
}

/// @nodoc
class _$HistoryLoadSuccessCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res>
    implements $HistoryLoadSuccessCopyWith<$Res> {
  _$HistoryLoadSuccessCopyWithImpl(
      HistoryLoadSuccess _value, $Res Function(HistoryLoadSuccess) _then)
      : super(_value, (v) => _then(v as HistoryLoadSuccess));

  @override
  HistoryLoadSuccess get _value => super._value as HistoryLoadSuccess;

  @override
  $Res call({
    Object? threads = freezed,
    Object? isLastPage = freezed,
  }) {
    return _then(HistoryLoadSuccess(
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
class _$HistoryLoadSuccess implements HistoryLoadSuccess {
  const _$HistoryLoadSuccess({required this.threads, required this.isLastPage});

  @override
  final List<Thread> threads;
  @override
  final bool isLastPage;

  @override
  String toString() {
    return 'HistoryState.historyLoadSuccess(threads: $threads, isLastPage: $isLastPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HistoryLoadSuccess &&
            (identical(other.threads, threads) ||
                const DeepCollectionEquality()
                    .equals(other.threads, threads)) &&
            (identical(other.isLastPage, isLastPage) ||
                const DeepCollectionEquality()
                    .equals(other.isLastPage, isLastPage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(threads) ^
      const DeepCollectionEquality().hash(isLastPage);

  @JsonKey(ignore: true)
  @override
  $HistoryLoadSuccessCopyWith<HistoryLoadSuccess> get copyWith =>
      _$HistoryLoadSuccessCopyWithImpl<HistoryLoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() historyInitial,
    required TResult Function(List<Thread> threads, bool isLastPage)
        historyLoadSuccess,
    required TResult Function() historyLoadError,
    required TResult Function() historyIsEmpty,
    required TResult Function() historyClearInProgress,
  }) {
    return historyLoadSuccess(threads, isLastPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? historyInitial,
    TResult Function(List<Thread> threads, bool isLastPage)? historyLoadSuccess,
    TResult Function()? historyLoadError,
    TResult Function()? historyIsEmpty,
    TResult Function()? historyClearInProgress,
    required TResult orElse(),
  }) {
    if (historyLoadSuccess != null) {
      return historyLoadSuccess(threads, isLastPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HistoryInitial value) historyInitial,
    required TResult Function(HistoryLoadSuccess value) historyLoadSuccess,
    required TResult Function(HistoryLoadError value) historyLoadError,
    required TResult Function(HistoryIsEmpty value) historyIsEmpty,
    required TResult Function(HistoryClearInProgress value)
        historyClearInProgress,
  }) {
    return historyLoadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryInitial value)? historyInitial,
    TResult Function(HistoryLoadSuccess value)? historyLoadSuccess,
    TResult Function(HistoryLoadError value)? historyLoadError,
    TResult Function(HistoryIsEmpty value)? historyIsEmpty,
    TResult Function(HistoryClearInProgress value)? historyClearInProgress,
    required TResult orElse(),
  }) {
    if (historyLoadSuccess != null) {
      return historyLoadSuccess(this);
    }
    return orElse();
  }
}

abstract class HistoryLoadSuccess implements HistoryState {
  const factory HistoryLoadSuccess(
      {required List<Thread> threads,
      required bool isLastPage}) = _$HistoryLoadSuccess;

  List<Thread> get threads => throw _privateConstructorUsedError;
  bool get isLastPage => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryLoadSuccessCopyWith<HistoryLoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryLoadErrorCopyWith<$Res> {
  factory $HistoryLoadErrorCopyWith(
          HistoryLoadError value, $Res Function(HistoryLoadError) then) =
      _$HistoryLoadErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$HistoryLoadErrorCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res>
    implements $HistoryLoadErrorCopyWith<$Res> {
  _$HistoryLoadErrorCopyWithImpl(
      HistoryLoadError _value, $Res Function(HistoryLoadError) _then)
      : super(_value, (v) => _then(v as HistoryLoadError));

  @override
  HistoryLoadError get _value => super._value as HistoryLoadError;
}

/// @nodoc
class _$HistoryLoadError implements HistoryLoadError {
  const _$HistoryLoadError();

  @override
  String toString() {
    return 'HistoryState.historyLoadError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is HistoryLoadError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() historyInitial,
    required TResult Function(List<Thread> threads, bool isLastPage)
        historyLoadSuccess,
    required TResult Function() historyLoadError,
    required TResult Function() historyIsEmpty,
    required TResult Function() historyClearInProgress,
  }) {
    return historyLoadError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? historyInitial,
    TResult Function(List<Thread> threads, bool isLastPage)? historyLoadSuccess,
    TResult Function()? historyLoadError,
    TResult Function()? historyIsEmpty,
    TResult Function()? historyClearInProgress,
    required TResult orElse(),
  }) {
    if (historyLoadError != null) {
      return historyLoadError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HistoryInitial value) historyInitial,
    required TResult Function(HistoryLoadSuccess value) historyLoadSuccess,
    required TResult Function(HistoryLoadError value) historyLoadError,
    required TResult Function(HistoryIsEmpty value) historyIsEmpty,
    required TResult Function(HistoryClearInProgress value)
        historyClearInProgress,
  }) {
    return historyLoadError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryInitial value)? historyInitial,
    TResult Function(HistoryLoadSuccess value)? historyLoadSuccess,
    TResult Function(HistoryLoadError value)? historyLoadError,
    TResult Function(HistoryIsEmpty value)? historyIsEmpty,
    TResult Function(HistoryClearInProgress value)? historyClearInProgress,
    required TResult orElse(),
  }) {
    if (historyLoadError != null) {
      return historyLoadError(this);
    }
    return orElse();
  }
}

abstract class HistoryLoadError implements HistoryState {
  const factory HistoryLoadError() = _$HistoryLoadError;
}

/// @nodoc
abstract class $HistoryIsEmptyCopyWith<$Res> {
  factory $HistoryIsEmptyCopyWith(
          HistoryIsEmpty value, $Res Function(HistoryIsEmpty) then) =
      _$HistoryIsEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class _$HistoryIsEmptyCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res>
    implements $HistoryIsEmptyCopyWith<$Res> {
  _$HistoryIsEmptyCopyWithImpl(
      HistoryIsEmpty _value, $Res Function(HistoryIsEmpty) _then)
      : super(_value, (v) => _then(v as HistoryIsEmpty));

  @override
  HistoryIsEmpty get _value => super._value as HistoryIsEmpty;
}

/// @nodoc
class _$HistoryIsEmpty implements HistoryIsEmpty {
  const _$HistoryIsEmpty();

  @override
  String toString() {
    return 'HistoryState.historyIsEmpty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is HistoryIsEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() historyInitial,
    required TResult Function(List<Thread> threads, bool isLastPage)
        historyLoadSuccess,
    required TResult Function() historyLoadError,
    required TResult Function() historyIsEmpty,
    required TResult Function() historyClearInProgress,
  }) {
    return historyIsEmpty();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? historyInitial,
    TResult Function(List<Thread> threads, bool isLastPage)? historyLoadSuccess,
    TResult Function()? historyLoadError,
    TResult Function()? historyIsEmpty,
    TResult Function()? historyClearInProgress,
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
    required TResult Function(HistoryInitial value) historyInitial,
    required TResult Function(HistoryLoadSuccess value) historyLoadSuccess,
    required TResult Function(HistoryLoadError value) historyLoadError,
    required TResult Function(HistoryIsEmpty value) historyIsEmpty,
    required TResult Function(HistoryClearInProgress value)
        historyClearInProgress,
  }) {
    return historyIsEmpty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryInitial value)? historyInitial,
    TResult Function(HistoryLoadSuccess value)? historyLoadSuccess,
    TResult Function(HistoryLoadError value)? historyLoadError,
    TResult Function(HistoryIsEmpty value)? historyIsEmpty,
    TResult Function(HistoryClearInProgress value)? historyClearInProgress,
    required TResult orElse(),
  }) {
    if (historyIsEmpty != null) {
      return historyIsEmpty(this);
    }
    return orElse();
  }
}

abstract class HistoryIsEmpty implements HistoryState {
  const factory HistoryIsEmpty() = _$HistoryIsEmpty;
}

/// @nodoc
abstract class $HistoryClearInProgressCopyWith<$Res> {
  factory $HistoryClearInProgressCopyWith(HistoryClearInProgress value,
          $Res Function(HistoryClearInProgress) then) =
      _$HistoryClearInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class _$HistoryClearInProgressCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res>
    implements $HistoryClearInProgressCopyWith<$Res> {
  _$HistoryClearInProgressCopyWithImpl(HistoryClearInProgress _value,
      $Res Function(HistoryClearInProgress) _then)
      : super(_value, (v) => _then(v as HistoryClearInProgress));

  @override
  HistoryClearInProgress get _value => super._value as HistoryClearInProgress;
}

/// @nodoc
class _$HistoryClearInProgress implements HistoryClearInProgress {
  const _$HistoryClearInProgress();

  @override
  String toString() {
    return 'HistoryState.historyClearInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is HistoryClearInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() historyInitial,
    required TResult Function(List<Thread> threads, bool isLastPage)
        historyLoadSuccess,
    required TResult Function() historyLoadError,
    required TResult Function() historyIsEmpty,
    required TResult Function() historyClearInProgress,
  }) {
    return historyClearInProgress();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? historyInitial,
    TResult Function(List<Thread> threads, bool isLastPage)? historyLoadSuccess,
    TResult Function()? historyLoadError,
    TResult Function()? historyIsEmpty,
    TResult Function()? historyClearInProgress,
    required TResult orElse(),
  }) {
    if (historyClearInProgress != null) {
      return historyClearInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HistoryInitial value) historyInitial,
    required TResult Function(HistoryLoadSuccess value) historyLoadSuccess,
    required TResult Function(HistoryLoadError value) historyLoadError,
    required TResult Function(HistoryIsEmpty value) historyIsEmpty,
    required TResult Function(HistoryClearInProgress value)
        historyClearInProgress,
  }) {
    return historyClearInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryInitial value)? historyInitial,
    TResult Function(HistoryLoadSuccess value)? historyLoadSuccess,
    TResult Function(HistoryLoadError value)? historyLoadError,
    TResult Function(HistoryIsEmpty value)? historyIsEmpty,
    TResult Function(HistoryClearInProgress value)? historyClearInProgress,
    required TResult orElse(),
  }) {
    if (historyClearInProgress != null) {
      return historyClearInProgress(this);
    }
    return orElse();
  }
}

abstract class HistoryClearInProgress implements HistoryState {
  const factory HistoryClearInProgress() = _$HistoryClearInProgress;
}
