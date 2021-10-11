// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'favorites_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FavoritesStateTearOff {
  const _$FavoritesStateTearOff();

  FavoritesStateInitial initial() {
    return const FavoritesStateInitial();
  }

  FavoritesStateLoadSuccess loadSuccess({required List<Board> favorites}) {
    return FavoritesStateLoadSuccess(
      favorites: favorites,
    );
  }

  FavoritesStateLoadError loadError() {
    return const FavoritesStateLoadError();
  }

  FavoritesStateFavoritesListIsEmpty favoritesListIsEmpty() {
    return const FavoritesStateFavoritesListIsEmpty();
  }
}

/// @nodoc
const $FavoritesState = _$FavoritesStateTearOff();

/// @nodoc
mixin _$FavoritesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Board> favorites) loadSuccess,
    required TResult Function() loadError,
    required TResult Function() favoritesListIsEmpty,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Board> favorites)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? favoritesListIsEmpty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoritesStateInitial value) initial,
    required TResult Function(FavoritesStateLoadSuccess value) loadSuccess,
    required TResult Function(FavoritesStateLoadError value) loadError,
    required TResult Function(FavoritesStateFavoritesListIsEmpty value) favoritesListIsEmpty,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoritesStateInitial value)? initial,
    TResult Function(FavoritesStateLoadSuccess value)? loadSuccess,
    TResult Function(FavoritesStateLoadError value)? loadError,
    TResult Function(FavoritesStateFavoritesListIsEmpty value)? favoritesListIsEmpty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritesStateCopyWith<$Res> {
  factory $FavoritesStateCopyWith(FavoritesState value, $Res Function(FavoritesState) then) =
      _$FavoritesStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$FavoritesStateCopyWithImpl<$Res> implements $FavoritesStateCopyWith<$Res> {
  _$FavoritesStateCopyWithImpl(this._value, this._then);

  final FavoritesState _value;

  // ignore: unused_field
  final $Res Function(FavoritesState) _then;
}

/// @nodoc
abstract class $FavoritesStateInitialCopyWith<$Res> {
  factory $FavoritesStateInitialCopyWith(FavoritesStateInitial value, $Res Function(FavoritesStateInitial) then) =
      _$FavoritesStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$FavoritesStateInitialCopyWithImpl<$Res> extends _$FavoritesStateCopyWithImpl<$Res>
    implements $FavoritesStateInitialCopyWith<$Res> {
  _$FavoritesStateInitialCopyWithImpl(FavoritesStateInitial _value, $Res Function(FavoritesStateInitial) _then)
      : super(_value, (v) => _then(v as FavoritesStateInitial));

  @override
  FavoritesStateInitial get _value => super._value as FavoritesStateInitial;
}

/// @nodoc
class _$FavoritesStateInitial implements FavoritesStateInitial {
  const _$FavoritesStateInitial();

  @override
  String toString() {
    return 'FavoritesState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FavoritesStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Board> favorites) loadSuccess,
    required TResult Function() loadError,
    required TResult Function() favoritesListIsEmpty,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Board> favorites)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? favoritesListIsEmpty,
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
    required TResult Function(FavoritesStateInitial value) initial,
    required TResult Function(FavoritesStateLoadSuccess value) loadSuccess,
    required TResult Function(FavoritesStateLoadError value) loadError,
    required TResult Function(FavoritesStateFavoritesListIsEmpty value) favoritesListIsEmpty,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoritesStateInitial value)? initial,
    TResult Function(FavoritesStateLoadSuccess value)? loadSuccess,
    TResult Function(FavoritesStateLoadError value)? loadError,
    TResult Function(FavoritesStateFavoritesListIsEmpty value)? favoritesListIsEmpty,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class FavoritesStateInitial implements FavoritesState {
  const factory FavoritesStateInitial() = _$FavoritesStateInitial;
}

/// @nodoc
abstract class $FavoritesStateLoadSuccessCopyWith<$Res> {
  factory $FavoritesStateLoadSuccessCopyWith(
          FavoritesStateLoadSuccess value, $Res Function(FavoritesStateLoadSuccess) then) =
      _$FavoritesStateLoadSuccessCopyWithImpl<$Res>;

  $Res call({List<Board> favorites});
}

/// @nodoc
class _$FavoritesStateLoadSuccessCopyWithImpl<$Res> extends _$FavoritesStateCopyWithImpl<$Res>
    implements $FavoritesStateLoadSuccessCopyWith<$Res> {
  _$FavoritesStateLoadSuccessCopyWithImpl(
      FavoritesStateLoadSuccess _value, $Res Function(FavoritesStateLoadSuccess) _then)
      : super(_value, (v) => _then(v as FavoritesStateLoadSuccess));

  @override
  FavoritesStateLoadSuccess get _value => super._value as FavoritesStateLoadSuccess;

  @override
  $Res call({
    Object? favorites = freezed,
  }) {
    return _then(FavoritesStateLoadSuccess(
      favorites: favorites == freezed
          ? _value.favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<Board>,
    ));
  }
}

/// @nodoc
class _$FavoritesStateLoadSuccess implements FavoritesStateLoadSuccess {
  const _$FavoritesStateLoadSuccess({required this.favorites});

  @override
  final List<Board> favorites;

  @override
  String toString() {
    return 'FavoritesState.loadSuccess(favorites: $favorites)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FavoritesStateLoadSuccess &&
            (identical(other.favorites, favorites) ||
                const DeepCollectionEquality().equals(other.favorites, favorites)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(favorites);

  @JsonKey(ignore: true)
  @override
  $FavoritesStateLoadSuccessCopyWith<FavoritesStateLoadSuccess> get copyWith =>
      _$FavoritesStateLoadSuccessCopyWithImpl<FavoritesStateLoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Board> favorites) loadSuccess,
    required TResult Function() loadError,
    required TResult Function() favoritesListIsEmpty,
  }) {
    return loadSuccess(favorites);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Board> favorites)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? favoritesListIsEmpty,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(favorites);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoritesStateInitial value) initial,
    required TResult Function(FavoritesStateLoadSuccess value) loadSuccess,
    required TResult Function(FavoritesStateLoadError value) loadError,
    required TResult Function(FavoritesStateFavoritesListIsEmpty value) favoritesListIsEmpty,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoritesStateInitial value)? initial,
    TResult Function(FavoritesStateLoadSuccess value)? loadSuccess,
    TResult Function(FavoritesStateLoadError value)? loadError,
    TResult Function(FavoritesStateFavoritesListIsEmpty value)? favoritesListIsEmpty,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class FavoritesStateLoadSuccess implements FavoritesState {
  const factory FavoritesStateLoadSuccess({required List<Board> favorites}) = _$FavoritesStateLoadSuccess;

  List<Board> get favorites => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoritesStateLoadSuccessCopyWith<FavoritesStateLoadSuccess> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritesStateLoadErrorCopyWith<$Res> {
  factory $FavoritesStateLoadErrorCopyWith(FavoritesStateLoadError value, $Res Function(FavoritesStateLoadError) then) =
      _$FavoritesStateLoadErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$FavoritesStateLoadErrorCopyWithImpl<$Res> extends _$FavoritesStateCopyWithImpl<$Res>
    implements $FavoritesStateLoadErrorCopyWith<$Res> {
  _$FavoritesStateLoadErrorCopyWithImpl(FavoritesStateLoadError _value, $Res Function(FavoritesStateLoadError) _then)
      : super(_value, (v) => _then(v as FavoritesStateLoadError));

  @override
  FavoritesStateLoadError get _value => super._value as FavoritesStateLoadError;
}

/// @nodoc
class _$FavoritesStateLoadError implements FavoritesStateLoadError {
  const _$FavoritesStateLoadError();

  @override
  String toString() {
    return 'FavoritesState.loadError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FavoritesStateLoadError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Board> favorites) loadSuccess,
    required TResult Function() loadError,
    required TResult Function() favoritesListIsEmpty,
  }) {
    return loadError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Board> favorites)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? favoritesListIsEmpty,
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
    required TResult Function(FavoritesStateInitial value) initial,
    required TResult Function(FavoritesStateLoadSuccess value) loadSuccess,
    required TResult Function(FavoritesStateLoadError value) loadError,
    required TResult Function(FavoritesStateFavoritesListIsEmpty value) favoritesListIsEmpty,
  }) {
    return loadError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoritesStateInitial value)? initial,
    TResult Function(FavoritesStateLoadSuccess value)? loadSuccess,
    TResult Function(FavoritesStateLoadError value)? loadError,
    TResult Function(FavoritesStateFavoritesListIsEmpty value)? favoritesListIsEmpty,
    required TResult orElse(),
  }) {
    if (loadError != null) {
      return loadError(this);
    }
    return orElse();
  }
}

abstract class FavoritesStateLoadError implements FavoritesState {
  const factory FavoritesStateLoadError() = _$FavoritesStateLoadError;
}

/// @nodoc
abstract class $FavoritesStateFavoritesListIsEmptyCopyWith<$Res> {
  factory $FavoritesStateFavoritesListIsEmptyCopyWith(
          FavoritesStateFavoritesListIsEmpty value, $Res Function(FavoritesStateFavoritesListIsEmpty) then) =
      _$FavoritesStateFavoritesListIsEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class _$FavoritesStateFavoritesListIsEmptyCopyWithImpl<$Res> extends _$FavoritesStateCopyWithImpl<$Res>
    implements $FavoritesStateFavoritesListIsEmptyCopyWith<$Res> {
  _$FavoritesStateFavoritesListIsEmptyCopyWithImpl(
      FavoritesStateFavoritesListIsEmpty _value, $Res Function(FavoritesStateFavoritesListIsEmpty) _then)
      : super(_value, (v) => _then(v as FavoritesStateFavoritesListIsEmpty));

  @override
  FavoritesStateFavoritesListIsEmpty get _value => super._value as FavoritesStateFavoritesListIsEmpty;
}

/// @nodoc
class _$FavoritesStateFavoritesListIsEmpty implements FavoritesStateFavoritesListIsEmpty {
  const _$FavoritesStateFavoritesListIsEmpty();

  @override
  String toString() {
    return 'FavoritesState.favoritesListIsEmpty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FavoritesStateFavoritesListIsEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Board> favorites) loadSuccess,
    required TResult Function() loadError,
    required TResult Function() favoritesListIsEmpty,
  }) {
    return favoritesListIsEmpty();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Board> favorites)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? favoritesListIsEmpty,
    required TResult orElse(),
  }) {
    if (favoritesListIsEmpty != null) {
      return favoritesListIsEmpty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoritesStateInitial value) initial,
    required TResult Function(FavoritesStateLoadSuccess value) loadSuccess,
    required TResult Function(FavoritesStateLoadError value) loadError,
    required TResult Function(FavoritesStateFavoritesListIsEmpty value) favoritesListIsEmpty,
  }) {
    return favoritesListIsEmpty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoritesStateInitial value)? initial,
    TResult Function(FavoritesStateLoadSuccess value)? loadSuccess,
    TResult Function(FavoritesStateLoadError value)? loadError,
    TResult Function(FavoritesStateFavoritesListIsEmpty value)? favoritesListIsEmpty,
    required TResult orElse(),
  }) {
    if (favoritesListIsEmpty != null) {
      return favoritesListIsEmpty(this);
    }
    return orElse();
  }
}

abstract class FavoritesStateFavoritesListIsEmpty implements FavoritesState {
  const factory FavoritesStateFavoritesListIsEmpty() = _$FavoritesStateFavoritesListIsEmpty;
}
