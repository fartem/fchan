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

  BoardInitial boardInitial() {
    return const BoardInitial();
  }

  BoardLoadSuccess boardLoadSuccess(
      {required List<Thread> threads, required bool isLastPage}) {
    return BoardLoadSuccess(
      threads: threads,
      isLastPage: isLastPage,
    );
  }

  BoardLoadError boardLoadError() {
    return const BoardLoadError();
  }

  BoardIsEmpty boardIsEmpty() {
    return const BoardIsEmpty();
  }
}

/// @nodoc
const $BoardState = _$BoardStateTearOff();

/// @nodoc
mixin _$BoardState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() boardInitial,
    required TResult Function(List<Thread> threads, bool isLastPage)
        boardLoadSuccess,
    required TResult Function() boardLoadError,
    required TResult Function() boardIsEmpty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? boardInitial,
    TResult Function(List<Thread> threads, bool isLastPage)? boardLoadSuccess,
    TResult Function()? boardLoadError,
    TResult Function()? boardIsEmpty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BoardInitial value) boardInitial,
    required TResult Function(BoardLoadSuccess value) boardLoadSuccess,
    required TResult Function(BoardLoadError value) boardLoadError,
    required TResult Function(BoardIsEmpty value) boardIsEmpty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BoardInitial value)? boardInitial,
    TResult Function(BoardLoadSuccess value)? boardLoadSuccess,
    TResult Function(BoardLoadError value)? boardLoadError,
    TResult Function(BoardIsEmpty value)? boardIsEmpty,
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
abstract class $BoardInitialCopyWith<$Res> {
  factory $BoardInitialCopyWith(
          BoardInitial value, $Res Function(BoardInitial) then) =
      _$BoardInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$BoardInitialCopyWithImpl<$Res> extends _$BoardStateCopyWithImpl<$Res>
    implements $BoardInitialCopyWith<$Res> {
  _$BoardInitialCopyWithImpl(
      BoardInitial _value, $Res Function(BoardInitial) _then)
      : super(_value, (v) => _then(v as BoardInitial));

  @override
  BoardInitial get _value => super._value as BoardInitial;
}

/// @nodoc
class _$BoardInitial implements BoardInitial {
  const _$BoardInitial();

  @override
  String toString() {
    return 'BoardState.boardInitial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BoardInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() boardInitial,
    required TResult Function(List<Thread> threads, bool isLastPage)
        boardLoadSuccess,
    required TResult Function() boardLoadError,
    required TResult Function() boardIsEmpty,
  }) {
    return boardInitial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? boardInitial,
    TResult Function(List<Thread> threads, bool isLastPage)? boardLoadSuccess,
    TResult Function()? boardLoadError,
    TResult Function()? boardIsEmpty,
    required TResult orElse(),
  }) {
    if (boardInitial != null) {
      return boardInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BoardInitial value) boardInitial,
    required TResult Function(BoardLoadSuccess value) boardLoadSuccess,
    required TResult Function(BoardLoadError value) boardLoadError,
    required TResult Function(BoardIsEmpty value) boardIsEmpty,
  }) {
    return boardInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BoardInitial value)? boardInitial,
    TResult Function(BoardLoadSuccess value)? boardLoadSuccess,
    TResult Function(BoardLoadError value)? boardLoadError,
    TResult Function(BoardIsEmpty value)? boardIsEmpty,
    required TResult orElse(),
  }) {
    if (boardInitial != null) {
      return boardInitial(this);
    }
    return orElse();
  }
}

abstract class BoardInitial implements BoardState {
  const factory BoardInitial() = _$BoardInitial;
}

/// @nodoc
abstract class $BoardLoadSuccessCopyWith<$Res> {
  factory $BoardLoadSuccessCopyWith(
          BoardLoadSuccess value, $Res Function(BoardLoadSuccess) then) =
      _$BoardLoadSuccessCopyWithImpl<$Res>;
  $Res call({List<Thread> threads, bool isLastPage});
}

/// @nodoc
class _$BoardLoadSuccessCopyWithImpl<$Res>
    extends _$BoardStateCopyWithImpl<$Res>
    implements $BoardLoadSuccessCopyWith<$Res> {
  _$BoardLoadSuccessCopyWithImpl(
      BoardLoadSuccess _value, $Res Function(BoardLoadSuccess) _then)
      : super(_value, (v) => _then(v as BoardLoadSuccess));

  @override
  BoardLoadSuccess get _value => super._value as BoardLoadSuccess;

  @override
  $Res call({
    Object? threads = freezed,
    Object? isLastPage = freezed,
  }) {
    return _then(BoardLoadSuccess(
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
class _$BoardLoadSuccess implements BoardLoadSuccess {
  const _$BoardLoadSuccess({required this.threads, required this.isLastPage});

  @override
  final List<Thread> threads;
  @override
  final bool isLastPage;

  @override
  String toString() {
    return 'BoardState.boardLoadSuccess(threads: $threads, isLastPage: $isLastPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BoardLoadSuccess &&
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
  $BoardLoadSuccessCopyWith<BoardLoadSuccess> get copyWith =>
      _$BoardLoadSuccessCopyWithImpl<BoardLoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() boardInitial,
    required TResult Function(List<Thread> threads, bool isLastPage)
        boardLoadSuccess,
    required TResult Function() boardLoadError,
    required TResult Function() boardIsEmpty,
  }) {
    return boardLoadSuccess(threads, isLastPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? boardInitial,
    TResult Function(List<Thread> threads, bool isLastPage)? boardLoadSuccess,
    TResult Function()? boardLoadError,
    TResult Function()? boardIsEmpty,
    required TResult orElse(),
  }) {
    if (boardLoadSuccess != null) {
      return boardLoadSuccess(threads, isLastPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BoardInitial value) boardInitial,
    required TResult Function(BoardLoadSuccess value) boardLoadSuccess,
    required TResult Function(BoardLoadError value) boardLoadError,
    required TResult Function(BoardIsEmpty value) boardIsEmpty,
  }) {
    return boardLoadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BoardInitial value)? boardInitial,
    TResult Function(BoardLoadSuccess value)? boardLoadSuccess,
    TResult Function(BoardLoadError value)? boardLoadError,
    TResult Function(BoardIsEmpty value)? boardIsEmpty,
    required TResult orElse(),
  }) {
    if (boardLoadSuccess != null) {
      return boardLoadSuccess(this);
    }
    return orElse();
  }
}

abstract class BoardLoadSuccess implements BoardState {
  const factory BoardLoadSuccess(
      {required List<Thread> threads,
      required bool isLastPage}) = _$BoardLoadSuccess;

  List<Thread> get threads => throw _privateConstructorUsedError;
  bool get isLastPage => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoardLoadSuccessCopyWith<BoardLoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardLoadErrorCopyWith<$Res> {
  factory $BoardLoadErrorCopyWith(
          BoardLoadError value, $Res Function(BoardLoadError) then) =
      _$BoardLoadErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$BoardLoadErrorCopyWithImpl<$Res> extends _$BoardStateCopyWithImpl<$Res>
    implements $BoardLoadErrorCopyWith<$Res> {
  _$BoardLoadErrorCopyWithImpl(
      BoardLoadError _value, $Res Function(BoardLoadError) _then)
      : super(_value, (v) => _then(v as BoardLoadError));

  @override
  BoardLoadError get _value => super._value as BoardLoadError;
}

/// @nodoc
class _$BoardLoadError implements BoardLoadError {
  const _$BoardLoadError();

  @override
  String toString() {
    return 'BoardState.boardLoadError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BoardLoadError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() boardInitial,
    required TResult Function(List<Thread> threads, bool isLastPage)
        boardLoadSuccess,
    required TResult Function() boardLoadError,
    required TResult Function() boardIsEmpty,
  }) {
    return boardLoadError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? boardInitial,
    TResult Function(List<Thread> threads, bool isLastPage)? boardLoadSuccess,
    TResult Function()? boardLoadError,
    TResult Function()? boardIsEmpty,
    required TResult orElse(),
  }) {
    if (boardLoadError != null) {
      return boardLoadError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BoardInitial value) boardInitial,
    required TResult Function(BoardLoadSuccess value) boardLoadSuccess,
    required TResult Function(BoardLoadError value) boardLoadError,
    required TResult Function(BoardIsEmpty value) boardIsEmpty,
  }) {
    return boardLoadError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BoardInitial value)? boardInitial,
    TResult Function(BoardLoadSuccess value)? boardLoadSuccess,
    TResult Function(BoardLoadError value)? boardLoadError,
    TResult Function(BoardIsEmpty value)? boardIsEmpty,
    required TResult orElse(),
  }) {
    if (boardLoadError != null) {
      return boardLoadError(this);
    }
    return orElse();
  }
}

abstract class BoardLoadError implements BoardState {
  const factory BoardLoadError() = _$BoardLoadError;
}

/// @nodoc
abstract class $BoardIsEmptyCopyWith<$Res> {
  factory $BoardIsEmptyCopyWith(
          BoardIsEmpty value, $Res Function(BoardIsEmpty) then) =
      _$BoardIsEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class _$BoardIsEmptyCopyWithImpl<$Res> extends _$BoardStateCopyWithImpl<$Res>
    implements $BoardIsEmptyCopyWith<$Res> {
  _$BoardIsEmptyCopyWithImpl(
      BoardIsEmpty _value, $Res Function(BoardIsEmpty) _then)
      : super(_value, (v) => _then(v as BoardIsEmpty));

  @override
  BoardIsEmpty get _value => super._value as BoardIsEmpty;
}

/// @nodoc
class _$BoardIsEmpty implements BoardIsEmpty {
  const _$BoardIsEmpty();

  @override
  String toString() {
    return 'BoardState.boardIsEmpty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BoardIsEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() boardInitial,
    required TResult Function(List<Thread> threads, bool isLastPage)
        boardLoadSuccess,
    required TResult Function() boardLoadError,
    required TResult Function() boardIsEmpty,
  }) {
    return boardIsEmpty();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? boardInitial,
    TResult Function(List<Thread> threads, bool isLastPage)? boardLoadSuccess,
    TResult Function()? boardLoadError,
    TResult Function()? boardIsEmpty,
    required TResult orElse(),
  }) {
    if (boardIsEmpty != null) {
      return boardIsEmpty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BoardInitial value) boardInitial,
    required TResult Function(BoardLoadSuccess value) boardLoadSuccess,
    required TResult Function(BoardLoadError value) boardLoadError,
    required TResult Function(BoardIsEmpty value) boardIsEmpty,
  }) {
    return boardIsEmpty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BoardInitial value)? boardInitial,
    TResult Function(BoardLoadSuccess value)? boardLoadSuccess,
    TResult Function(BoardLoadError value)? boardLoadError,
    TResult Function(BoardIsEmpty value)? boardIsEmpty,
    required TResult orElse(),
  }) {
    if (boardIsEmpty != null) {
      return boardIsEmpty(this);
    }
    return orElse();
  }
}

abstract class BoardIsEmpty implements BoardState {
  const factory BoardIsEmpty() = _$BoardIsEmpty;
}
