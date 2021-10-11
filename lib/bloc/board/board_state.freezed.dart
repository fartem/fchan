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

  BoardStateInitial initial() {
    return const BoardStateInitial();
  }

  BoardStateLoadSuccess loadSuccess({required List<Thread> threads, required bool isLastPage}) {
    return BoardStateLoadSuccess(
      threads: threads,
      isLastPage: isLastPage,
    );
  }

  BoardStateLoadError loadError() {
    return const BoardStateLoadError();
  }

  BoardStateIsEmpty isEmpty() {
    return const BoardStateIsEmpty();
  }
}

/// @nodoc
const $BoardState = _$BoardStateTearOff();

/// @nodoc
mixin _$BoardState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Thread> threads, bool isLastPage) loadSuccess,
    required TResult Function() loadError,
    required TResult Function() isEmpty,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Thread> threads, bool isLastPage)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? isEmpty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BoardStateInitial value) initial,
    required TResult Function(BoardStateLoadSuccess value) loadSuccess,
    required TResult Function(BoardStateLoadError value) loadError,
    required TResult Function(BoardStateIsEmpty value) isEmpty,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BoardStateInitial value)? initial,
    TResult Function(BoardStateLoadSuccess value)? loadSuccess,
    TResult Function(BoardStateLoadError value)? loadError,
    TResult Function(BoardStateIsEmpty value)? isEmpty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardStateCopyWith<$Res> {
  factory $BoardStateCopyWith(BoardState value, $Res Function(BoardState) then) = _$BoardStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$BoardStateCopyWithImpl<$Res> implements $BoardStateCopyWith<$Res> {
  _$BoardStateCopyWithImpl(this._value, this._then);

  final BoardState _value;

  // ignore: unused_field
  final $Res Function(BoardState) _then;
}

/// @nodoc
abstract class $BoardStateInitialCopyWith<$Res> {
  factory $BoardStateInitialCopyWith(BoardStateInitial value, $Res Function(BoardStateInitial) then) =
      _$BoardStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$BoardStateInitialCopyWithImpl<$Res> extends _$BoardStateCopyWithImpl<$Res>
    implements $BoardStateInitialCopyWith<$Res> {
  _$BoardStateInitialCopyWithImpl(BoardStateInitial _value, $Res Function(BoardStateInitial) _then)
      : super(_value, (v) => _then(v as BoardStateInitial));

  @override
  BoardStateInitial get _value => super._value as BoardStateInitial;
}

/// @nodoc
class _$BoardStateInitial implements BoardStateInitial {
  const _$BoardStateInitial();

  @override
  String toString() {
    return 'BoardState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BoardStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Thread> threads, bool isLastPage) loadSuccess,
    required TResult Function() loadError,
    required TResult Function() isEmpty,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Thread> threads, bool isLastPage)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? isEmpty,
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
    required TResult Function(BoardStateInitial value) initial,
    required TResult Function(BoardStateLoadSuccess value) loadSuccess,
    required TResult Function(BoardStateLoadError value) loadError,
    required TResult Function(BoardStateIsEmpty value) isEmpty,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BoardStateInitial value)? initial,
    TResult Function(BoardStateLoadSuccess value)? loadSuccess,
    TResult Function(BoardStateLoadError value)? loadError,
    TResult Function(BoardStateIsEmpty value)? isEmpty,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class BoardStateInitial implements BoardState {
  const factory BoardStateInitial() = _$BoardStateInitial;
}

/// @nodoc
abstract class $BoardStateLoadSuccessCopyWith<$Res> {
  factory $BoardStateLoadSuccessCopyWith(BoardStateLoadSuccess value, $Res Function(BoardStateLoadSuccess) then) =
      _$BoardStateLoadSuccessCopyWithImpl<$Res>;

  $Res call({List<Thread> threads, bool isLastPage});
}

/// @nodoc
class _$BoardStateLoadSuccessCopyWithImpl<$Res> extends _$BoardStateCopyWithImpl<$Res>
    implements $BoardStateLoadSuccessCopyWith<$Res> {
  _$BoardStateLoadSuccessCopyWithImpl(BoardStateLoadSuccess _value, $Res Function(BoardStateLoadSuccess) _then)
      : super(_value, (v) => _then(v as BoardStateLoadSuccess));

  @override
  BoardStateLoadSuccess get _value => super._value as BoardStateLoadSuccess;

  @override
  $Res call({
    Object? threads = freezed,
    Object? isLastPage = freezed,
  }) {
    return _then(BoardStateLoadSuccess(
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
class _$BoardStateLoadSuccess implements BoardStateLoadSuccess {
  const _$BoardStateLoadSuccess({required this.threads, required this.isLastPage});

  @override
  final List<Thread> threads;
  @override
  final bool isLastPage;

  @override
  String toString() {
    return 'BoardState.loadSuccess(threads: $threads, isLastPage: $isLastPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BoardStateLoadSuccess &&
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
  $BoardStateLoadSuccessCopyWith<BoardStateLoadSuccess> get copyWith =>
      _$BoardStateLoadSuccessCopyWithImpl<BoardStateLoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Thread> threads, bool isLastPage) loadSuccess,
    required TResult Function() loadError,
    required TResult Function() isEmpty,
  }) {
    return loadSuccess(threads, isLastPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Thread> threads, bool isLastPage)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? isEmpty,
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
    required TResult Function(BoardStateInitial value) initial,
    required TResult Function(BoardStateLoadSuccess value) loadSuccess,
    required TResult Function(BoardStateLoadError value) loadError,
    required TResult Function(BoardStateIsEmpty value) isEmpty,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BoardStateInitial value)? initial,
    TResult Function(BoardStateLoadSuccess value)? loadSuccess,
    TResult Function(BoardStateLoadError value)? loadError,
    TResult Function(BoardStateIsEmpty value)? isEmpty,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class BoardStateLoadSuccess implements BoardState {
  const factory BoardStateLoadSuccess({required List<Thread> threads, required bool isLastPage}) =
      _$BoardStateLoadSuccess;

  List<Thread> get threads => throw _privateConstructorUsedError;

  bool get isLastPage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BoardStateLoadSuccessCopyWith<BoardStateLoadSuccess> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardStateLoadErrorCopyWith<$Res> {
  factory $BoardStateLoadErrorCopyWith(BoardStateLoadError value, $Res Function(BoardStateLoadError) then) =
      _$BoardStateLoadErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$BoardStateLoadErrorCopyWithImpl<$Res> extends _$BoardStateCopyWithImpl<$Res>
    implements $BoardStateLoadErrorCopyWith<$Res> {
  _$BoardStateLoadErrorCopyWithImpl(BoardStateLoadError _value, $Res Function(BoardStateLoadError) _then)
      : super(_value, (v) => _then(v as BoardStateLoadError));

  @override
  BoardStateLoadError get _value => super._value as BoardStateLoadError;
}

/// @nodoc
class _$BoardStateLoadError implements BoardStateLoadError {
  const _$BoardStateLoadError();

  @override
  String toString() {
    return 'BoardState.loadError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BoardStateLoadError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Thread> threads, bool isLastPage) loadSuccess,
    required TResult Function() loadError,
    required TResult Function() isEmpty,
  }) {
    return loadError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Thread> threads, bool isLastPage)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? isEmpty,
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
    required TResult Function(BoardStateInitial value) initial,
    required TResult Function(BoardStateLoadSuccess value) loadSuccess,
    required TResult Function(BoardStateLoadError value) loadError,
    required TResult Function(BoardStateIsEmpty value) isEmpty,
  }) {
    return loadError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BoardStateInitial value)? initial,
    TResult Function(BoardStateLoadSuccess value)? loadSuccess,
    TResult Function(BoardStateLoadError value)? loadError,
    TResult Function(BoardStateIsEmpty value)? isEmpty,
    required TResult orElse(),
  }) {
    if (loadError != null) {
      return loadError(this);
    }
    return orElse();
  }
}

abstract class BoardStateLoadError implements BoardState {
  const factory BoardStateLoadError() = _$BoardStateLoadError;
}

/// @nodoc
abstract class $BoardStateIsEmptyCopyWith<$Res> {
  factory $BoardStateIsEmptyCopyWith(BoardStateIsEmpty value, $Res Function(BoardStateIsEmpty) then) =
      _$BoardStateIsEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class _$BoardStateIsEmptyCopyWithImpl<$Res> extends _$BoardStateCopyWithImpl<$Res>
    implements $BoardStateIsEmptyCopyWith<$Res> {
  _$BoardStateIsEmptyCopyWithImpl(BoardStateIsEmpty _value, $Res Function(BoardStateIsEmpty) _then)
      : super(_value, (v) => _then(v as BoardStateIsEmpty));

  @override
  BoardStateIsEmpty get _value => super._value as BoardStateIsEmpty;
}

/// @nodoc
class _$BoardStateIsEmpty implements BoardStateIsEmpty {
  const _$BoardStateIsEmpty();

  @override
  String toString() {
    return 'BoardState.isEmpty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BoardStateIsEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Thread> threads, bool isLastPage) loadSuccess,
    required TResult Function() loadError,
    required TResult Function() isEmpty,
  }) {
    return isEmpty();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Thread> threads, bool isLastPage)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? isEmpty,
    required TResult orElse(),
  }) {
    if (isEmpty != null) {
      return isEmpty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BoardStateInitial value) initial,
    required TResult Function(BoardStateLoadSuccess value) loadSuccess,
    required TResult Function(BoardStateLoadError value) loadError,
    required TResult Function(BoardStateIsEmpty value) isEmpty,
  }) {
    return isEmpty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BoardStateInitial value)? initial,
    TResult Function(BoardStateLoadSuccess value)? loadSuccess,
    TResult Function(BoardStateLoadError value)? loadError,
    TResult Function(BoardStateIsEmpty value)? isEmpty,
    required TResult orElse(),
  }) {
    if (isEmpty != null) {
      return isEmpty(this);
    }
    return orElse();
  }
}

abstract class BoardStateIsEmpty implements BoardState {
  const factory BoardStateIsEmpty() = _$BoardStateIsEmpty;
}
