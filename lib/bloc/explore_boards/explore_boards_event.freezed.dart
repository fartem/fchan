// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'explore_boards_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ExploreBoardsEventTearOff {
  const _$ExploreBoardsEventTearOff();

  ExploreBoardsEventInitialized initialized() {
    return const ExploreBoardsEventInitialized();
  }

  ExploreBoardsEventBoardAddedToFavorites boardAddedToFavorites({required Board board}) {
    return ExploreBoardsEventBoardAddedToFavorites(
      board: board,
    );
  }

  ExploreBoardsEventBoardRemovedFromFavorites boardRemovedToFavorites({required Board board}) {
    return ExploreBoardsEventBoardRemovedFromFavorites(
      board: board,
    );
  }
}

/// @nodoc
const $ExploreBoardsEvent = _$ExploreBoardsEventTearOff();

/// @nodoc
mixin _$ExploreBoardsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(Board board) boardAddedToFavorites,
    required TResult Function(Board board) boardRemovedToFavorites,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(Board board)? boardAddedToFavorites,
    TResult Function(Board board)? boardRemovedToFavorites,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExploreBoardsEventInitialized value) initialized,
    required TResult Function(ExploreBoardsEventBoardAddedToFavorites value) boardAddedToFavorites,
    required TResult Function(ExploreBoardsEventBoardRemovedFromFavorites value) boardRemovedToFavorites,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExploreBoardsEventInitialized value)? initialized,
    TResult Function(ExploreBoardsEventBoardAddedToFavorites value)? boardAddedToFavorites,
    TResult Function(ExploreBoardsEventBoardRemovedFromFavorites value)? boardRemovedToFavorites,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExploreBoardsEventCopyWith<$Res> {
  factory $ExploreBoardsEventCopyWith(ExploreBoardsEvent value, $Res Function(ExploreBoardsEvent) then) =
      _$ExploreBoardsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ExploreBoardsEventCopyWithImpl<$Res> implements $ExploreBoardsEventCopyWith<$Res> {
  _$ExploreBoardsEventCopyWithImpl(this._value, this._then);

  final ExploreBoardsEvent _value;

  // ignore: unused_field
  final $Res Function(ExploreBoardsEvent) _then;
}

/// @nodoc
abstract class $ExploreBoardsEventInitializedCopyWith<$Res> {
  factory $ExploreBoardsEventInitializedCopyWith(
          ExploreBoardsEventInitialized value, $Res Function(ExploreBoardsEventInitialized) then) =
      _$ExploreBoardsEventInitializedCopyWithImpl<$Res>;
}

/// @nodoc
class _$ExploreBoardsEventInitializedCopyWithImpl<$Res> extends _$ExploreBoardsEventCopyWithImpl<$Res>
    implements $ExploreBoardsEventInitializedCopyWith<$Res> {
  _$ExploreBoardsEventInitializedCopyWithImpl(
      ExploreBoardsEventInitialized _value, $Res Function(ExploreBoardsEventInitialized) _then)
      : super(_value, (v) => _then(v as ExploreBoardsEventInitialized));

  @override
  ExploreBoardsEventInitialized get _value => super._value as ExploreBoardsEventInitialized;
}

/// @nodoc
class _$ExploreBoardsEventInitialized implements ExploreBoardsEventInitialized {
  const _$ExploreBoardsEventInitialized();

  @override
  String toString() {
    return 'ExploreBoardsEvent.initialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ExploreBoardsEventInitialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(Board board) boardAddedToFavorites,
    required TResult Function(Board board) boardRemovedToFavorites,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(Board board)? boardAddedToFavorites,
    TResult Function(Board board)? boardRemovedToFavorites,
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
    required TResult Function(ExploreBoardsEventInitialized value) initialized,
    required TResult Function(ExploreBoardsEventBoardAddedToFavorites value) boardAddedToFavorites,
    required TResult Function(ExploreBoardsEventBoardRemovedFromFavorites value) boardRemovedToFavorites,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExploreBoardsEventInitialized value)? initialized,
    TResult Function(ExploreBoardsEventBoardAddedToFavorites value)? boardAddedToFavorites,
    TResult Function(ExploreBoardsEventBoardRemovedFromFavorites value)? boardRemovedToFavorites,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class ExploreBoardsEventInitialized implements ExploreBoardsEvent {
  const factory ExploreBoardsEventInitialized() = _$ExploreBoardsEventInitialized;
}

/// @nodoc
abstract class $ExploreBoardsEventBoardAddedToFavoritesCopyWith<$Res> {
  factory $ExploreBoardsEventBoardAddedToFavoritesCopyWith(
          ExploreBoardsEventBoardAddedToFavorites value, $Res Function(ExploreBoardsEventBoardAddedToFavorites) then) =
      _$ExploreBoardsEventBoardAddedToFavoritesCopyWithImpl<$Res>;

  $Res call({Board board});
}

/// @nodoc
class _$ExploreBoardsEventBoardAddedToFavoritesCopyWithImpl<$Res> extends _$ExploreBoardsEventCopyWithImpl<$Res>
    implements $ExploreBoardsEventBoardAddedToFavoritesCopyWith<$Res> {
  _$ExploreBoardsEventBoardAddedToFavoritesCopyWithImpl(
      ExploreBoardsEventBoardAddedToFavorites _value, $Res Function(ExploreBoardsEventBoardAddedToFavorites) _then)
      : super(_value, (v) => _then(v as ExploreBoardsEventBoardAddedToFavorites));

  @override
  ExploreBoardsEventBoardAddedToFavorites get _value => super._value as ExploreBoardsEventBoardAddedToFavorites;

  @override
  $Res call({
    Object? board = freezed,
  }) {
    return _then(ExploreBoardsEventBoardAddedToFavorites(
      board: board == freezed
          ? _value.board
          : board // ignore: cast_nullable_to_non_nullable
              as Board,
    ));
  }
}

/// @nodoc
class _$ExploreBoardsEventBoardAddedToFavorites implements ExploreBoardsEventBoardAddedToFavorites {
  const _$ExploreBoardsEventBoardAddedToFavorites({required this.board});

  @override
  final Board board;

  @override
  String toString() {
    return 'ExploreBoardsEvent.boardAddedToFavorites(board: $board)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExploreBoardsEventBoardAddedToFavorites &&
            (identical(other.board, board) || const DeepCollectionEquality().equals(other.board, board)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(board);

  @JsonKey(ignore: true)
  @override
  $ExploreBoardsEventBoardAddedToFavoritesCopyWith<ExploreBoardsEventBoardAddedToFavorites> get copyWith =>
      _$ExploreBoardsEventBoardAddedToFavoritesCopyWithImpl<ExploreBoardsEventBoardAddedToFavorites>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(Board board) boardAddedToFavorites,
    required TResult Function(Board board) boardRemovedToFavorites,
  }) {
    return boardAddedToFavorites(board);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(Board board)? boardAddedToFavorites,
    TResult Function(Board board)? boardRemovedToFavorites,
    required TResult orElse(),
  }) {
    if (boardAddedToFavorites != null) {
      return boardAddedToFavorites(board);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExploreBoardsEventInitialized value) initialized,
    required TResult Function(ExploreBoardsEventBoardAddedToFavorites value) boardAddedToFavorites,
    required TResult Function(ExploreBoardsEventBoardRemovedFromFavorites value) boardRemovedToFavorites,
  }) {
    return boardAddedToFavorites(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExploreBoardsEventInitialized value)? initialized,
    TResult Function(ExploreBoardsEventBoardAddedToFavorites value)? boardAddedToFavorites,
    TResult Function(ExploreBoardsEventBoardRemovedFromFavorites value)? boardRemovedToFavorites,
    required TResult orElse(),
  }) {
    if (boardAddedToFavorites != null) {
      return boardAddedToFavorites(this);
    }
    return orElse();
  }
}

abstract class ExploreBoardsEventBoardAddedToFavorites implements ExploreBoardsEvent {
  const factory ExploreBoardsEventBoardAddedToFavorites({required Board board}) =
      _$ExploreBoardsEventBoardAddedToFavorites;

  Board get board => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExploreBoardsEventBoardAddedToFavoritesCopyWith<ExploreBoardsEventBoardAddedToFavorites> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExploreBoardsEventBoardRemovedFromFavoritesCopyWith<$Res> {
  factory $ExploreBoardsEventBoardRemovedFromFavoritesCopyWith(ExploreBoardsEventBoardRemovedFromFavorites value,
          $Res Function(ExploreBoardsEventBoardRemovedFromFavorites) then) =
      _$ExploreBoardsEventBoardRemovedFromFavoritesCopyWithImpl<$Res>;

  $Res call({Board board});
}

/// @nodoc
class _$ExploreBoardsEventBoardRemovedFromFavoritesCopyWithImpl<$Res> extends _$ExploreBoardsEventCopyWithImpl<$Res>
    implements $ExploreBoardsEventBoardRemovedFromFavoritesCopyWith<$Res> {
  _$ExploreBoardsEventBoardRemovedFromFavoritesCopyWithImpl(ExploreBoardsEventBoardRemovedFromFavorites _value,
      $Res Function(ExploreBoardsEventBoardRemovedFromFavorites) _then)
      : super(_value, (v) => _then(v as ExploreBoardsEventBoardRemovedFromFavorites));

  @override
  ExploreBoardsEventBoardRemovedFromFavorites get _value => super._value as ExploreBoardsEventBoardRemovedFromFavorites;

  @override
  $Res call({
    Object? board = freezed,
  }) {
    return _then(ExploreBoardsEventBoardRemovedFromFavorites(
      board: board == freezed
          ? _value.board
          : board // ignore: cast_nullable_to_non_nullable
              as Board,
    ));
  }
}

/// @nodoc
class _$ExploreBoardsEventBoardRemovedFromFavorites implements ExploreBoardsEventBoardRemovedFromFavorites {
  const _$ExploreBoardsEventBoardRemovedFromFavorites({required this.board});

  @override
  final Board board;

  @override
  String toString() {
    return 'ExploreBoardsEvent.boardRemovedToFavorites(board: $board)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExploreBoardsEventBoardRemovedFromFavorites &&
            (identical(other.board, board) || const DeepCollectionEquality().equals(other.board, board)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(board);

  @JsonKey(ignore: true)
  @override
  $ExploreBoardsEventBoardRemovedFromFavoritesCopyWith<ExploreBoardsEventBoardRemovedFromFavorites> get copyWith =>
      _$ExploreBoardsEventBoardRemovedFromFavoritesCopyWithImpl<ExploreBoardsEventBoardRemovedFromFavorites>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(Board board) boardAddedToFavorites,
    required TResult Function(Board board) boardRemovedToFavorites,
  }) {
    return boardRemovedToFavorites(board);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(Board board)? boardAddedToFavorites,
    TResult Function(Board board)? boardRemovedToFavorites,
    required TResult orElse(),
  }) {
    if (boardRemovedToFavorites != null) {
      return boardRemovedToFavorites(board);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExploreBoardsEventInitialized value) initialized,
    required TResult Function(ExploreBoardsEventBoardAddedToFavorites value) boardAddedToFavorites,
    required TResult Function(ExploreBoardsEventBoardRemovedFromFavorites value) boardRemovedToFavorites,
  }) {
    return boardRemovedToFavorites(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExploreBoardsEventInitialized value)? initialized,
    TResult Function(ExploreBoardsEventBoardAddedToFavorites value)? boardAddedToFavorites,
    TResult Function(ExploreBoardsEventBoardRemovedFromFavorites value)? boardRemovedToFavorites,
    required TResult orElse(),
  }) {
    if (boardRemovedToFavorites != null) {
      return boardRemovedToFavorites(this);
    }
    return orElse();
  }
}

abstract class ExploreBoardsEventBoardRemovedFromFavorites implements ExploreBoardsEvent {
  const factory ExploreBoardsEventBoardRemovedFromFavorites({required Board board}) =
      _$ExploreBoardsEventBoardRemovedFromFavorites;

  Board get board => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExploreBoardsEventBoardRemovedFromFavoritesCopyWith<ExploreBoardsEventBoardRemovedFromFavorites> get copyWith =>
      throw _privateConstructorUsedError;
}
