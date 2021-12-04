// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'bookmarks_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BookmarksStateTearOff {
  const _$BookmarksStateTearOff();

  BookmarksStateInitial initial() {
    return const BookmarksStateInitial();
  }

  BookmarksStateLoadSuccess loadSuccess(
      {required List<Thread> threads, required bool isLastPage}) {
    return BookmarksStateLoadSuccess(
      threads: threads,
      isLastPage: isLastPage,
    );
  }

  BookmarksStateLoadError loadError() {
    return const BookmarksStateLoadError();
  }

  BookmarksStateClearInProgress clearInProgress() {
    return const BookmarksStateClearInProgress();
  }

  BookmarksStateBookmarksListIsEmpty bookmarksListIsEmpty() {
    return const BookmarksStateBookmarksListIsEmpty();
  }
}

/// @nodoc
const $BookmarksState = _$BookmarksStateTearOff();

/// @nodoc
mixin _$BookmarksState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Thread> threads, bool isLastPage)
        loadSuccess,
    required TResult Function() loadError,
    required TResult Function() clearInProgress,
    required TResult Function() bookmarksListIsEmpty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Thread> threads, bool isLastPage)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? clearInProgress,
    TResult Function()? bookmarksListIsEmpty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookmarksStateInitial value) initial,
    required TResult Function(BookmarksStateLoadSuccess value) loadSuccess,
    required TResult Function(BookmarksStateLoadError value) loadError,
    required TResult Function(BookmarksStateClearInProgress value)
        clearInProgress,
    required TResult Function(BookmarksStateBookmarksListIsEmpty value)
        bookmarksListIsEmpty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookmarksStateInitial value)? initial,
    TResult Function(BookmarksStateLoadSuccess value)? loadSuccess,
    TResult Function(BookmarksStateLoadError value)? loadError,
    TResult Function(BookmarksStateClearInProgress value)? clearInProgress,
    TResult Function(BookmarksStateBookmarksListIsEmpty value)?
        bookmarksListIsEmpty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarksStateCopyWith<$Res> {
  factory $BookmarksStateCopyWith(
          BookmarksState value, $Res Function(BookmarksState) then) =
      _$BookmarksStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$BookmarksStateCopyWithImpl<$Res>
    implements $BookmarksStateCopyWith<$Res> {
  _$BookmarksStateCopyWithImpl(this._value, this._then);

  final BookmarksState _value;
  // ignore: unused_field
  final $Res Function(BookmarksState) _then;
}

/// @nodoc
abstract class $BookmarksStateInitialCopyWith<$Res> {
  factory $BookmarksStateInitialCopyWith(BookmarksStateInitial value,
          $Res Function(BookmarksStateInitial) then) =
      _$BookmarksStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$BookmarksStateInitialCopyWithImpl<$Res>
    extends _$BookmarksStateCopyWithImpl<$Res>
    implements $BookmarksStateInitialCopyWith<$Res> {
  _$BookmarksStateInitialCopyWithImpl(
      BookmarksStateInitial _value, $Res Function(BookmarksStateInitial) _then)
      : super(_value, (v) => _then(v as BookmarksStateInitial));

  @override
  BookmarksStateInitial get _value => super._value as BookmarksStateInitial;
}

/// @nodoc
class _$BookmarksStateInitial implements BookmarksStateInitial {
  const _$BookmarksStateInitial();

  @override
  String toString() {
    return 'BookmarksState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BookmarksStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Thread> threads, bool isLastPage)
        loadSuccess,
    required TResult Function() loadError,
    required TResult Function() clearInProgress,
    required TResult Function() bookmarksListIsEmpty,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Thread> threads, bool isLastPage)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? clearInProgress,
    TResult Function()? bookmarksListIsEmpty,
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
    required TResult Function(BookmarksStateInitial value) initial,
    required TResult Function(BookmarksStateLoadSuccess value) loadSuccess,
    required TResult Function(BookmarksStateLoadError value) loadError,
    required TResult Function(BookmarksStateClearInProgress value)
        clearInProgress,
    required TResult Function(BookmarksStateBookmarksListIsEmpty value)
        bookmarksListIsEmpty,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookmarksStateInitial value)? initial,
    TResult Function(BookmarksStateLoadSuccess value)? loadSuccess,
    TResult Function(BookmarksStateLoadError value)? loadError,
    TResult Function(BookmarksStateClearInProgress value)? clearInProgress,
    TResult Function(BookmarksStateBookmarksListIsEmpty value)?
        bookmarksListIsEmpty,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class BookmarksStateInitial implements BookmarksState {
  const factory BookmarksStateInitial() = _$BookmarksStateInitial;
}

/// @nodoc
abstract class $BookmarksStateLoadSuccessCopyWith<$Res> {
  factory $BookmarksStateLoadSuccessCopyWith(BookmarksStateLoadSuccess value,
          $Res Function(BookmarksStateLoadSuccess) then) =
      _$BookmarksStateLoadSuccessCopyWithImpl<$Res>;
  $Res call({List<Thread> threads, bool isLastPage});
}

/// @nodoc
class _$BookmarksStateLoadSuccessCopyWithImpl<$Res>
    extends _$BookmarksStateCopyWithImpl<$Res>
    implements $BookmarksStateLoadSuccessCopyWith<$Res> {
  _$BookmarksStateLoadSuccessCopyWithImpl(BookmarksStateLoadSuccess _value,
      $Res Function(BookmarksStateLoadSuccess) _then)
      : super(_value, (v) => _then(v as BookmarksStateLoadSuccess));

  @override
  BookmarksStateLoadSuccess get _value =>
      super._value as BookmarksStateLoadSuccess;

  @override
  $Res call({
    Object? threads = freezed,
    Object? isLastPage = freezed,
  }) {
    return _then(BookmarksStateLoadSuccess(
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
class _$BookmarksStateLoadSuccess implements BookmarksStateLoadSuccess {
  const _$BookmarksStateLoadSuccess(
      {required this.threads, required this.isLastPage});

  @override
  final List<Thread> threads;
  @override
  final bool isLastPage;

  @override
  String toString() {
    return 'BookmarksState.loadSuccess(threads: $threads, isLastPage: $isLastPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BookmarksStateLoadSuccess &&
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
  $BookmarksStateLoadSuccessCopyWith<BookmarksStateLoadSuccess> get copyWith =>
      _$BookmarksStateLoadSuccessCopyWithImpl<BookmarksStateLoadSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Thread> threads, bool isLastPage)
        loadSuccess,
    required TResult Function() loadError,
    required TResult Function() clearInProgress,
    required TResult Function() bookmarksListIsEmpty,
  }) {
    return loadSuccess(threads, isLastPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Thread> threads, bool isLastPage)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? clearInProgress,
    TResult Function()? bookmarksListIsEmpty,
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
    required TResult Function(BookmarksStateInitial value) initial,
    required TResult Function(BookmarksStateLoadSuccess value) loadSuccess,
    required TResult Function(BookmarksStateLoadError value) loadError,
    required TResult Function(BookmarksStateClearInProgress value)
        clearInProgress,
    required TResult Function(BookmarksStateBookmarksListIsEmpty value)
        bookmarksListIsEmpty,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookmarksStateInitial value)? initial,
    TResult Function(BookmarksStateLoadSuccess value)? loadSuccess,
    TResult Function(BookmarksStateLoadError value)? loadError,
    TResult Function(BookmarksStateClearInProgress value)? clearInProgress,
    TResult Function(BookmarksStateBookmarksListIsEmpty value)?
        bookmarksListIsEmpty,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class BookmarksStateLoadSuccess implements BookmarksState {
  const factory BookmarksStateLoadSuccess(
      {required List<Thread> threads,
      required bool isLastPage}) = _$BookmarksStateLoadSuccess;

  List<Thread> get threads => throw _privateConstructorUsedError;
  bool get isLastPage => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookmarksStateLoadSuccessCopyWith<BookmarksStateLoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarksStateLoadErrorCopyWith<$Res> {
  factory $BookmarksStateLoadErrorCopyWith(BookmarksStateLoadError value,
          $Res Function(BookmarksStateLoadError) then) =
      _$BookmarksStateLoadErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$BookmarksStateLoadErrorCopyWithImpl<$Res>
    extends _$BookmarksStateCopyWithImpl<$Res>
    implements $BookmarksStateLoadErrorCopyWith<$Res> {
  _$BookmarksStateLoadErrorCopyWithImpl(BookmarksStateLoadError _value,
      $Res Function(BookmarksStateLoadError) _then)
      : super(_value, (v) => _then(v as BookmarksStateLoadError));

  @override
  BookmarksStateLoadError get _value => super._value as BookmarksStateLoadError;
}

/// @nodoc
class _$BookmarksStateLoadError implements BookmarksStateLoadError {
  const _$BookmarksStateLoadError();

  @override
  String toString() {
    return 'BookmarksState.loadError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BookmarksStateLoadError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Thread> threads, bool isLastPage)
        loadSuccess,
    required TResult Function() loadError,
    required TResult Function() clearInProgress,
    required TResult Function() bookmarksListIsEmpty,
  }) {
    return loadError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Thread> threads, bool isLastPage)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? clearInProgress,
    TResult Function()? bookmarksListIsEmpty,
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
    required TResult Function(BookmarksStateInitial value) initial,
    required TResult Function(BookmarksStateLoadSuccess value) loadSuccess,
    required TResult Function(BookmarksStateLoadError value) loadError,
    required TResult Function(BookmarksStateClearInProgress value)
        clearInProgress,
    required TResult Function(BookmarksStateBookmarksListIsEmpty value)
        bookmarksListIsEmpty,
  }) {
    return loadError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookmarksStateInitial value)? initial,
    TResult Function(BookmarksStateLoadSuccess value)? loadSuccess,
    TResult Function(BookmarksStateLoadError value)? loadError,
    TResult Function(BookmarksStateClearInProgress value)? clearInProgress,
    TResult Function(BookmarksStateBookmarksListIsEmpty value)?
        bookmarksListIsEmpty,
    required TResult orElse(),
  }) {
    if (loadError != null) {
      return loadError(this);
    }
    return orElse();
  }
}

abstract class BookmarksStateLoadError implements BookmarksState {
  const factory BookmarksStateLoadError() = _$BookmarksStateLoadError;
}

/// @nodoc
abstract class $BookmarksStateClearInProgressCopyWith<$Res> {
  factory $BookmarksStateClearInProgressCopyWith(
          BookmarksStateClearInProgress value,
          $Res Function(BookmarksStateClearInProgress) then) =
      _$BookmarksStateClearInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class _$BookmarksStateClearInProgressCopyWithImpl<$Res>
    extends _$BookmarksStateCopyWithImpl<$Res>
    implements $BookmarksStateClearInProgressCopyWith<$Res> {
  _$BookmarksStateClearInProgressCopyWithImpl(
      BookmarksStateClearInProgress _value,
      $Res Function(BookmarksStateClearInProgress) _then)
      : super(_value, (v) => _then(v as BookmarksStateClearInProgress));

  @override
  BookmarksStateClearInProgress get _value =>
      super._value as BookmarksStateClearInProgress;
}

/// @nodoc
class _$BookmarksStateClearInProgress implements BookmarksStateClearInProgress {
  const _$BookmarksStateClearInProgress();

  @override
  String toString() {
    return 'BookmarksState.clearInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BookmarksStateClearInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Thread> threads, bool isLastPage)
        loadSuccess,
    required TResult Function() loadError,
    required TResult Function() clearInProgress,
    required TResult Function() bookmarksListIsEmpty,
  }) {
    return clearInProgress();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Thread> threads, bool isLastPage)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? clearInProgress,
    TResult Function()? bookmarksListIsEmpty,
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
    required TResult Function(BookmarksStateInitial value) initial,
    required TResult Function(BookmarksStateLoadSuccess value) loadSuccess,
    required TResult Function(BookmarksStateLoadError value) loadError,
    required TResult Function(BookmarksStateClearInProgress value)
        clearInProgress,
    required TResult Function(BookmarksStateBookmarksListIsEmpty value)
        bookmarksListIsEmpty,
  }) {
    return clearInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookmarksStateInitial value)? initial,
    TResult Function(BookmarksStateLoadSuccess value)? loadSuccess,
    TResult Function(BookmarksStateLoadError value)? loadError,
    TResult Function(BookmarksStateClearInProgress value)? clearInProgress,
    TResult Function(BookmarksStateBookmarksListIsEmpty value)?
        bookmarksListIsEmpty,
    required TResult orElse(),
  }) {
    if (clearInProgress != null) {
      return clearInProgress(this);
    }
    return orElse();
  }
}

abstract class BookmarksStateClearInProgress implements BookmarksState {
  const factory BookmarksStateClearInProgress() =
      _$BookmarksStateClearInProgress;
}

/// @nodoc
abstract class $BookmarksStateBookmarksListIsEmptyCopyWith<$Res> {
  factory $BookmarksStateBookmarksListIsEmptyCopyWith(
          BookmarksStateBookmarksListIsEmpty value,
          $Res Function(BookmarksStateBookmarksListIsEmpty) then) =
      _$BookmarksStateBookmarksListIsEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class _$BookmarksStateBookmarksListIsEmptyCopyWithImpl<$Res>
    extends _$BookmarksStateCopyWithImpl<$Res>
    implements $BookmarksStateBookmarksListIsEmptyCopyWith<$Res> {
  _$BookmarksStateBookmarksListIsEmptyCopyWithImpl(
      BookmarksStateBookmarksListIsEmpty _value,
      $Res Function(BookmarksStateBookmarksListIsEmpty) _then)
      : super(_value, (v) => _then(v as BookmarksStateBookmarksListIsEmpty));

  @override
  BookmarksStateBookmarksListIsEmpty get _value =>
      super._value as BookmarksStateBookmarksListIsEmpty;
}

/// @nodoc
class _$BookmarksStateBookmarksListIsEmpty
    implements BookmarksStateBookmarksListIsEmpty {
  const _$BookmarksStateBookmarksListIsEmpty();

  @override
  String toString() {
    return 'BookmarksState.bookmarksListIsEmpty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BookmarksStateBookmarksListIsEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Thread> threads, bool isLastPage)
        loadSuccess,
    required TResult Function() loadError,
    required TResult Function() clearInProgress,
    required TResult Function() bookmarksListIsEmpty,
  }) {
    return bookmarksListIsEmpty();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Thread> threads, bool isLastPage)? loadSuccess,
    TResult Function()? loadError,
    TResult Function()? clearInProgress,
    TResult Function()? bookmarksListIsEmpty,
    required TResult orElse(),
  }) {
    if (bookmarksListIsEmpty != null) {
      return bookmarksListIsEmpty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookmarksStateInitial value) initial,
    required TResult Function(BookmarksStateLoadSuccess value) loadSuccess,
    required TResult Function(BookmarksStateLoadError value) loadError,
    required TResult Function(BookmarksStateClearInProgress value)
        clearInProgress,
    required TResult Function(BookmarksStateBookmarksListIsEmpty value)
        bookmarksListIsEmpty,
  }) {
    return bookmarksListIsEmpty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookmarksStateInitial value)? initial,
    TResult Function(BookmarksStateLoadSuccess value)? loadSuccess,
    TResult Function(BookmarksStateLoadError value)? loadError,
    TResult Function(BookmarksStateClearInProgress value)? clearInProgress,
    TResult Function(BookmarksStateBookmarksListIsEmpty value)?
        bookmarksListIsEmpty,
    required TResult orElse(),
  }) {
    if (bookmarksListIsEmpty != null) {
      return bookmarksListIsEmpty(this);
    }
    return orElse();
  }
}

abstract class BookmarksStateBookmarksListIsEmpty implements BookmarksState {
  const factory BookmarksStateBookmarksListIsEmpty() =
      _$BookmarksStateBookmarksListIsEmpty;
}
