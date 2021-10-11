// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'explore_boards_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ExploreBoardsStateTearOff {
  const _$ExploreBoardsStateTearOff();

  ExploreBoardsStateInitial initial() {
    return const ExploreBoardsStateInitial();
  }

  ExploreBoardsStateLoadSuccess loadSuccess({required List<Board> boards}) {
    return ExploreBoardsStateLoadSuccess(
      boards: boards,
    );
  }

  ExploreBoardsStateLoadError loadError() {
    return const ExploreBoardsStateLoadError();
  }

  ExploreBoardsBoardsListIsEmpty boardsListIsEmpty() {
    return const ExploreBoardsBoardsListIsEmpty();
  }
}

/// @nodoc
const $ExploreBoardsState = _$ExploreBoardsStateTearOff();

/// @nodoc
mixin _$ExploreBoardsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Board> boards) loadSuccess,
    required TResult Function() loadError,
    required TResult Function() boardsListIsEmpty,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Board> boards)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? boardsListIsEmpty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExploreBoardsStateInitial value) initial,
    required TResult Function(ExploreBoardsStateLoadSuccess value) loadSuccess,
    required TResult Function(ExploreBoardsStateLoadError value) loadError,
    required TResult Function(ExploreBoardsBoardsListIsEmpty value) boardsListIsEmpty,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExploreBoardsStateInitial value)? initial,
    TResult Function(ExploreBoardsStateLoadSuccess value)? loadSuccess,
    TResult Function(ExploreBoardsStateLoadError value)? loadError,
    TResult Function(ExploreBoardsBoardsListIsEmpty value)? boardsListIsEmpty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExploreBoardsStateCopyWith<$Res> {
  factory $ExploreBoardsStateCopyWith(ExploreBoardsState value, $Res Function(ExploreBoardsState) then) =
      _$ExploreBoardsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ExploreBoardsStateCopyWithImpl<$Res> implements $ExploreBoardsStateCopyWith<$Res> {
  _$ExploreBoardsStateCopyWithImpl(this._value, this._then);

  final ExploreBoardsState _value;

  // ignore: unused_field
  final $Res Function(ExploreBoardsState) _then;
}

/// @nodoc
abstract class $ExploreBoardsStateInitialCopyWith<$Res> {
  factory $ExploreBoardsStateInitialCopyWith(
          ExploreBoardsStateInitial value, $Res Function(ExploreBoardsStateInitial) then) =
      _$ExploreBoardsStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$ExploreBoardsStateInitialCopyWithImpl<$Res> extends _$ExploreBoardsStateCopyWithImpl<$Res>
    implements $ExploreBoardsStateInitialCopyWith<$Res> {
  _$ExploreBoardsStateInitialCopyWithImpl(
      ExploreBoardsStateInitial _value, $Res Function(ExploreBoardsStateInitial) _then)
      : super(_value, (v) => _then(v as ExploreBoardsStateInitial));

  @override
  ExploreBoardsStateInitial get _value => super._value as ExploreBoardsStateInitial;
}

/// @nodoc
class _$ExploreBoardsStateInitial implements ExploreBoardsStateInitial {
  const _$ExploreBoardsStateInitial();

  @override
  String toString() {
    return 'ExploreBoardsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ExploreBoardsStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Board> boards) loadSuccess,
    required TResult Function() loadError,
    required TResult Function() boardsListIsEmpty,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Board> boards)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? boardsListIsEmpty,
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
    required TResult Function(ExploreBoardsStateInitial value) initial,
    required TResult Function(ExploreBoardsStateLoadSuccess value) loadSuccess,
    required TResult Function(ExploreBoardsStateLoadError value) loadError,
    required TResult Function(ExploreBoardsBoardsListIsEmpty value) boardsListIsEmpty,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExploreBoardsStateInitial value)? initial,
    TResult Function(ExploreBoardsStateLoadSuccess value)? loadSuccess,
    TResult Function(ExploreBoardsStateLoadError value)? loadError,
    TResult Function(ExploreBoardsBoardsListIsEmpty value)? boardsListIsEmpty,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ExploreBoardsStateInitial implements ExploreBoardsState {
  const factory ExploreBoardsStateInitial() = _$ExploreBoardsStateInitial;
}

/// @nodoc
abstract class $ExploreBoardsStateLoadSuccessCopyWith<$Res> {
  factory $ExploreBoardsStateLoadSuccessCopyWith(
          ExploreBoardsStateLoadSuccess value, $Res Function(ExploreBoardsStateLoadSuccess) then) =
      _$ExploreBoardsStateLoadSuccessCopyWithImpl<$Res>;

  $Res call({List<Board> boards});
}

/// @nodoc
class _$ExploreBoardsStateLoadSuccessCopyWithImpl<$Res> extends _$ExploreBoardsStateCopyWithImpl<$Res>
    implements $ExploreBoardsStateLoadSuccessCopyWith<$Res> {
  _$ExploreBoardsStateLoadSuccessCopyWithImpl(
      ExploreBoardsStateLoadSuccess _value, $Res Function(ExploreBoardsStateLoadSuccess) _then)
      : super(_value, (v) => _then(v as ExploreBoardsStateLoadSuccess));

  @override
  ExploreBoardsStateLoadSuccess get _value => super._value as ExploreBoardsStateLoadSuccess;

  @override
  $Res call({
    Object? boards = freezed,
  }) {
    return _then(ExploreBoardsStateLoadSuccess(
      boards: boards == freezed
          ? _value.boards
          : boards // ignore: cast_nullable_to_non_nullable
              as List<Board>,
    ));
  }
}

/// @nodoc
class _$ExploreBoardsStateLoadSuccess implements ExploreBoardsStateLoadSuccess {
  const _$ExploreBoardsStateLoadSuccess({required this.boards});

  @override
  final List<Board> boards;

  @override
  String toString() {
    return 'ExploreBoardsState.loadSuccess(boards: $boards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExploreBoardsStateLoadSuccess &&
            (identical(other.boards, boards) || const DeepCollectionEquality().equals(other.boards, boards)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(boards);

  @JsonKey(ignore: true)
  @override
  $ExploreBoardsStateLoadSuccessCopyWith<ExploreBoardsStateLoadSuccess> get copyWith =>
      _$ExploreBoardsStateLoadSuccessCopyWithImpl<ExploreBoardsStateLoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Board> boards) loadSuccess,
    required TResult Function() loadError,
    required TResult Function() boardsListIsEmpty,
  }) {
    return loadSuccess(boards);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Board> boards)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? boardsListIsEmpty,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(boards);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExploreBoardsStateInitial value) initial,
    required TResult Function(ExploreBoardsStateLoadSuccess value) loadSuccess,
    required TResult Function(ExploreBoardsStateLoadError value) loadError,
    required TResult Function(ExploreBoardsBoardsListIsEmpty value) boardsListIsEmpty,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExploreBoardsStateInitial value)? initial,
    TResult Function(ExploreBoardsStateLoadSuccess value)? loadSuccess,
    TResult Function(ExploreBoardsStateLoadError value)? loadError,
    TResult Function(ExploreBoardsBoardsListIsEmpty value)? boardsListIsEmpty,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class ExploreBoardsStateLoadSuccess implements ExploreBoardsState {
  const factory ExploreBoardsStateLoadSuccess({required List<Board> boards}) = _$ExploreBoardsStateLoadSuccess;

  List<Board> get boards => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExploreBoardsStateLoadSuccessCopyWith<ExploreBoardsStateLoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExploreBoardsStateLoadErrorCopyWith<$Res> {
  factory $ExploreBoardsStateLoadErrorCopyWith(
          ExploreBoardsStateLoadError value, $Res Function(ExploreBoardsStateLoadError) then) =
      _$ExploreBoardsStateLoadErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$ExploreBoardsStateLoadErrorCopyWithImpl<$Res> extends _$ExploreBoardsStateCopyWithImpl<$Res>
    implements $ExploreBoardsStateLoadErrorCopyWith<$Res> {
  _$ExploreBoardsStateLoadErrorCopyWithImpl(
      ExploreBoardsStateLoadError _value, $Res Function(ExploreBoardsStateLoadError) _then)
      : super(_value, (v) => _then(v as ExploreBoardsStateLoadError));

  @override
  ExploreBoardsStateLoadError get _value => super._value as ExploreBoardsStateLoadError;
}

/// @nodoc
class _$ExploreBoardsStateLoadError implements ExploreBoardsStateLoadError {
  const _$ExploreBoardsStateLoadError();

  @override
  String toString() {
    return 'ExploreBoardsState.loadError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ExploreBoardsStateLoadError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Board> boards) loadSuccess,
    required TResult Function() loadError,
    required TResult Function() boardsListIsEmpty,
  }) {
    return loadError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Board> boards)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? boardsListIsEmpty,
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
    required TResult Function(ExploreBoardsStateInitial value) initial,
    required TResult Function(ExploreBoardsStateLoadSuccess value) loadSuccess,
    required TResult Function(ExploreBoardsStateLoadError value) loadError,
    required TResult Function(ExploreBoardsBoardsListIsEmpty value) boardsListIsEmpty,
  }) {
    return loadError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExploreBoardsStateInitial value)? initial,
    TResult Function(ExploreBoardsStateLoadSuccess value)? loadSuccess,
    TResult Function(ExploreBoardsStateLoadError value)? loadError,
    TResult Function(ExploreBoardsBoardsListIsEmpty value)? boardsListIsEmpty,
    required TResult orElse(),
  }) {
    if (loadError != null) {
      return loadError(this);
    }
    return orElse();
  }
}

abstract class ExploreBoardsStateLoadError implements ExploreBoardsState {
  const factory ExploreBoardsStateLoadError() = _$ExploreBoardsStateLoadError;
}

/// @nodoc
abstract class $ExploreBoardsBoardsListIsEmptyCopyWith<$Res> {
  factory $ExploreBoardsBoardsListIsEmptyCopyWith(
          ExploreBoardsBoardsListIsEmpty value, $Res Function(ExploreBoardsBoardsListIsEmpty) then) =
      _$ExploreBoardsBoardsListIsEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class _$ExploreBoardsBoardsListIsEmptyCopyWithImpl<$Res> extends _$ExploreBoardsStateCopyWithImpl<$Res>
    implements $ExploreBoardsBoardsListIsEmptyCopyWith<$Res> {
  _$ExploreBoardsBoardsListIsEmptyCopyWithImpl(
      ExploreBoardsBoardsListIsEmpty _value, $Res Function(ExploreBoardsBoardsListIsEmpty) _then)
      : super(_value, (v) => _then(v as ExploreBoardsBoardsListIsEmpty));

  @override
  ExploreBoardsBoardsListIsEmpty get _value => super._value as ExploreBoardsBoardsListIsEmpty;
}

/// @nodoc
class _$ExploreBoardsBoardsListIsEmpty implements ExploreBoardsBoardsListIsEmpty {
  const _$ExploreBoardsBoardsListIsEmpty();

  @override
  String toString() {
    return 'ExploreBoardsState.boardsListIsEmpty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ExploreBoardsBoardsListIsEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Board> boards) loadSuccess,
    required TResult Function() loadError,
    required TResult Function() boardsListIsEmpty,
  }) {
    return boardsListIsEmpty();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Board> boards)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? boardsListIsEmpty,
    required TResult orElse(),
  }) {
    if (boardsListIsEmpty != null) {
      return boardsListIsEmpty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExploreBoardsStateInitial value) initial,
    required TResult Function(ExploreBoardsStateLoadSuccess value) loadSuccess,
    required TResult Function(ExploreBoardsStateLoadError value) loadError,
    required TResult Function(ExploreBoardsBoardsListIsEmpty value) boardsListIsEmpty,
  }) {
    return boardsListIsEmpty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExploreBoardsStateInitial value)? initial,
    TResult Function(ExploreBoardsStateLoadSuccess value)? loadSuccess,
    TResult Function(ExploreBoardsStateLoadError value)? loadError,
    TResult Function(ExploreBoardsBoardsListIsEmpty value)? boardsListIsEmpty,
    required TResult orElse(),
  }) {
    if (boardsListIsEmpty != null) {
      return boardsListIsEmpty(this);
    }
    return orElse();
  }
}

abstract class ExploreBoardsBoardsListIsEmpty implements ExploreBoardsState {
  const factory ExploreBoardsBoardsListIsEmpty() = _$ExploreBoardsBoardsListIsEmpty;
}
