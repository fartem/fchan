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

  FavoritesInitial favoritesInitial() {
    return const FavoritesInitial();
  }

  FavoritesLoadSuccess favoritesLoadSuccess({required List<Board> favorites}) {
    return FavoritesLoadSuccess(
      favorites: favorites,
    );
  }

  FavoritesLoadError favoritesLoadError() {
    return const FavoritesLoadError();
  }

  FavoritesAreEmpty favoritesAreEmpty() {
    return const FavoritesAreEmpty();
  }
}

/// @nodoc
const $FavoritesState = _$FavoritesStateTearOff();

/// @nodoc
mixin _$FavoritesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() favoritesInitial,
    required TResult Function(List<Board> favorites) favoritesLoadSuccess,
    required TResult Function() favoritesLoadError,
    required TResult Function() favoritesAreEmpty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? favoritesInitial,
    TResult Function(List<Board> favorites)? favoritesLoadSuccess,
    TResult Function()? favoritesLoadError,
    TResult Function()? favoritesAreEmpty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoritesInitial value) favoritesInitial,
    required TResult Function(FavoritesLoadSuccess value) favoritesLoadSuccess,
    required TResult Function(FavoritesLoadError value) favoritesLoadError,
    required TResult Function(FavoritesAreEmpty value) favoritesAreEmpty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoritesInitial value)? favoritesInitial,
    TResult Function(FavoritesLoadSuccess value)? favoritesLoadSuccess,
    TResult Function(FavoritesLoadError value)? favoritesLoadError,
    TResult Function(FavoritesAreEmpty value)? favoritesAreEmpty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritesStateCopyWith<$Res> {
  factory $FavoritesStateCopyWith(
          FavoritesState value, $Res Function(FavoritesState) then) =
      _$FavoritesStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$FavoritesStateCopyWithImpl<$Res>
    implements $FavoritesStateCopyWith<$Res> {
  _$FavoritesStateCopyWithImpl(this._value, this._then);

  final FavoritesState _value;
  // ignore: unused_field
  final $Res Function(FavoritesState) _then;
}

/// @nodoc
abstract class $FavoritesInitialCopyWith<$Res> {
  factory $FavoritesInitialCopyWith(
          FavoritesInitial value, $Res Function(FavoritesInitial) then) =
      _$FavoritesInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$FavoritesInitialCopyWithImpl<$Res>
    extends _$FavoritesStateCopyWithImpl<$Res>
    implements $FavoritesInitialCopyWith<$Res> {
  _$FavoritesInitialCopyWithImpl(
      FavoritesInitial _value, $Res Function(FavoritesInitial) _then)
      : super(_value, (v) => _then(v as FavoritesInitial));

  @override
  FavoritesInitial get _value => super._value as FavoritesInitial;
}

/// @nodoc
class _$FavoritesInitial implements FavoritesInitial {
  const _$FavoritesInitial();

  @override
  String toString() {
    return 'FavoritesState.favoritesInitial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FavoritesInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() favoritesInitial,
    required TResult Function(List<Board> favorites) favoritesLoadSuccess,
    required TResult Function() favoritesLoadError,
    required TResult Function() favoritesAreEmpty,
  }) {
    return favoritesInitial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? favoritesInitial,
    TResult Function(List<Board> favorites)? favoritesLoadSuccess,
    TResult Function()? favoritesLoadError,
    TResult Function()? favoritesAreEmpty,
    required TResult orElse(),
  }) {
    if (favoritesInitial != null) {
      return favoritesInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoritesInitial value) favoritesInitial,
    required TResult Function(FavoritesLoadSuccess value) favoritesLoadSuccess,
    required TResult Function(FavoritesLoadError value) favoritesLoadError,
    required TResult Function(FavoritesAreEmpty value) favoritesAreEmpty,
  }) {
    return favoritesInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoritesInitial value)? favoritesInitial,
    TResult Function(FavoritesLoadSuccess value)? favoritesLoadSuccess,
    TResult Function(FavoritesLoadError value)? favoritesLoadError,
    TResult Function(FavoritesAreEmpty value)? favoritesAreEmpty,
    required TResult orElse(),
  }) {
    if (favoritesInitial != null) {
      return favoritesInitial(this);
    }
    return orElse();
  }
}

abstract class FavoritesInitial implements FavoritesState {
  const factory FavoritesInitial() = _$FavoritesInitial;
}

/// @nodoc
abstract class $FavoritesLoadSuccessCopyWith<$Res> {
  factory $FavoritesLoadSuccessCopyWith(FavoritesLoadSuccess value,
          $Res Function(FavoritesLoadSuccess) then) =
      _$FavoritesLoadSuccessCopyWithImpl<$Res>;
  $Res call({List<Board> favorites});
}

/// @nodoc
class _$FavoritesLoadSuccessCopyWithImpl<$Res>
    extends _$FavoritesStateCopyWithImpl<$Res>
    implements $FavoritesLoadSuccessCopyWith<$Res> {
  _$FavoritesLoadSuccessCopyWithImpl(
      FavoritesLoadSuccess _value, $Res Function(FavoritesLoadSuccess) _then)
      : super(_value, (v) => _then(v as FavoritesLoadSuccess));

  @override
  FavoritesLoadSuccess get _value => super._value as FavoritesLoadSuccess;

  @override
  $Res call({
    Object? favorites = freezed,
  }) {
    return _then(FavoritesLoadSuccess(
      favorites: favorites == freezed
          ? _value.favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<Board>,
    ));
  }
}

/// @nodoc
class _$FavoritesLoadSuccess implements FavoritesLoadSuccess {
  const _$FavoritesLoadSuccess({required this.favorites});

  @override
  final List<Board> favorites;

  @override
  String toString() {
    return 'FavoritesState.favoritesLoadSuccess(favorites: $favorites)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FavoritesLoadSuccess &&
            (identical(other.favorites, favorites) ||
                const DeepCollectionEquality()
                    .equals(other.favorites, favorites)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(favorites);

  @JsonKey(ignore: true)
  @override
  $FavoritesLoadSuccessCopyWith<FavoritesLoadSuccess> get copyWith =>
      _$FavoritesLoadSuccessCopyWithImpl<FavoritesLoadSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() favoritesInitial,
    required TResult Function(List<Board> favorites) favoritesLoadSuccess,
    required TResult Function() favoritesLoadError,
    required TResult Function() favoritesAreEmpty,
  }) {
    return favoritesLoadSuccess(favorites);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? favoritesInitial,
    TResult Function(List<Board> favorites)? favoritesLoadSuccess,
    TResult Function()? favoritesLoadError,
    TResult Function()? favoritesAreEmpty,
    required TResult orElse(),
  }) {
    if (favoritesLoadSuccess != null) {
      return favoritesLoadSuccess(favorites);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoritesInitial value) favoritesInitial,
    required TResult Function(FavoritesLoadSuccess value) favoritesLoadSuccess,
    required TResult Function(FavoritesLoadError value) favoritesLoadError,
    required TResult Function(FavoritesAreEmpty value) favoritesAreEmpty,
  }) {
    return favoritesLoadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoritesInitial value)? favoritesInitial,
    TResult Function(FavoritesLoadSuccess value)? favoritesLoadSuccess,
    TResult Function(FavoritesLoadError value)? favoritesLoadError,
    TResult Function(FavoritesAreEmpty value)? favoritesAreEmpty,
    required TResult orElse(),
  }) {
    if (favoritesLoadSuccess != null) {
      return favoritesLoadSuccess(this);
    }
    return orElse();
  }
}

abstract class FavoritesLoadSuccess implements FavoritesState {
  const factory FavoritesLoadSuccess({required List<Board> favorites}) =
      _$FavoritesLoadSuccess;

  List<Board> get favorites => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoritesLoadSuccessCopyWith<FavoritesLoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritesLoadErrorCopyWith<$Res> {
  factory $FavoritesLoadErrorCopyWith(
          FavoritesLoadError value, $Res Function(FavoritesLoadError) then) =
      _$FavoritesLoadErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$FavoritesLoadErrorCopyWithImpl<$Res>
    extends _$FavoritesStateCopyWithImpl<$Res>
    implements $FavoritesLoadErrorCopyWith<$Res> {
  _$FavoritesLoadErrorCopyWithImpl(
      FavoritesLoadError _value, $Res Function(FavoritesLoadError) _then)
      : super(_value, (v) => _then(v as FavoritesLoadError));

  @override
  FavoritesLoadError get _value => super._value as FavoritesLoadError;
}

/// @nodoc
class _$FavoritesLoadError implements FavoritesLoadError {
  const _$FavoritesLoadError();

  @override
  String toString() {
    return 'FavoritesState.favoritesLoadError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FavoritesLoadError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() favoritesInitial,
    required TResult Function(List<Board> favorites) favoritesLoadSuccess,
    required TResult Function() favoritesLoadError,
    required TResult Function() favoritesAreEmpty,
  }) {
    return favoritesLoadError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? favoritesInitial,
    TResult Function(List<Board> favorites)? favoritesLoadSuccess,
    TResult Function()? favoritesLoadError,
    TResult Function()? favoritesAreEmpty,
    required TResult orElse(),
  }) {
    if (favoritesLoadError != null) {
      return favoritesLoadError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoritesInitial value) favoritesInitial,
    required TResult Function(FavoritesLoadSuccess value) favoritesLoadSuccess,
    required TResult Function(FavoritesLoadError value) favoritesLoadError,
    required TResult Function(FavoritesAreEmpty value) favoritesAreEmpty,
  }) {
    return favoritesLoadError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoritesInitial value)? favoritesInitial,
    TResult Function(FavoritesLoadSuccess value)? favoritesLoadSuccess,
    TResult Function(FavoritesLoadError value)? favoritesLoadError,
    TResult Function(FavoritesAreEmpty value)? favoritesAreEmpty,
    required TResult orElse(),
  }) {
    if (favoritesLoadError != null) {
      return favoritesLoadError(this);
    }
    return orElse();
  }
}

abstract class FavoritesLoadError implements FavoritesState {
  const factory FavoritesLoadError() = _$FavoritesLoadError;
}

/// @nodoc
abstract class $FavoritesAreEmptyCopyWith<$Res> {
  factory $FavoritesAreEmptyCopyWith(
          FavoritesAreEmpty value, $Res Function(FavoritesAreEmpty) then) =
      _$FavoritesAreEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class _$FavoritesAreEmptyCopyWithImpl<$Res>
    extends _$FavoritesStateCopyWithImpl<$Res>
    implements $FavoritesAreEmptyCopyWith<$Res> {
  _$FavoritesAreEmptyCopyWithImpl(
      FavoritesAreEmpty _value, $Res Function(FavoritesAreEmpty) _then)
      : super(_value, (v) => _then(v as FavoritesAreEmpty));

  @override
  FavoritesAreEmpty get _value => super._value as FavoritesAreEmpty;
}

/// @nodoc
class _$FavoritesAreEmpty implements FavoritesAreEmpty {
  const _$FavoritesAreEmpty();

  @override
  String toString() {
    return 'FavoritesState.favoritesAreEmpty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FavoritesAreEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() favoritesInitial,
    required TResult Function(List<Board> favorites) favoritesLoadSuccess,
    required TResult Function() favoritesLoadError,
    required TResult Function() favoritesAreEmpty,
  }) {
    return favoritesAreEmpty();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? favoritesInitial,
    TResult Function(List<Board> favorites)? favoritesLoadSuccess,
    TResult Function()? favoritesLoadError,
    TResult Function()? favoritesAreEmpty,
    required TResult orElse(),
  }) {
    if (favoritesAreEmpty != null) {
      return favoritesAreEmpty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoritesInitial value) favoritesInitial,
    required TResult Function(FavoritesLoadSuccess value) favoritesLoadSuccess,
    required TResult Function(FavoritesLoadError value) favoritesLoadError,
    required TResult Function(FavoritesAreEmpty value) favoritesAreEmpty,
  }) {
    return favoritesAreEmpty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoritesInitial value)? favoritesInitial,
    TResult Function(FavoritesLoadSuccess value)? favoritesLoadSuccess,
    TResult Function(FavoritesLoadError value)? favoritesLoadError,
    TResult Function(FavoritesAreEmpty value)? favoritesAreEmpty,
    required TResult orElse(),
  }) {
    if (favoritesAreEmpty != null) {
      return favoritesAreEmpty(this);
    }
    return orElse();
  }
}

abstract class FavoritesAreEmpty implements FavoritesState {
  const factory FavoritesAreEmpty() = _$FavoritesAreEmpty;
}
