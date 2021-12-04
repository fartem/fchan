// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'bookmarks_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BookmarksEventTearOff {
  const _$BookmarksEventTearOff();

  BookmarksEventInitialized initialized() {
    return const BookmarksEventInitialized();
  }

  BookmarksEventPortionRequested portionRequested() {
    return const BookmarksEventPortionRequested();
  }

  BookmarksEventUpdateRequested updateRequested() {
    return const BookmarksEventUpdateRequested();
  }

  BookmarksEventBookmarkRemoved bookmarkRemoved({required Thread bookmark}) {
    return BookmarksEventBookmarkRemoved(
      bookmark: bookmark,
    );
  }
}

/// @nodoc
const $BookmarksEvent = _$BookmarksEventTearOff();

/// @nodoc
mixin _$BookmarksEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() portionRequested,
    required TResult Function() updateRequested,
    required TResult Function(Thread bookmark) bookmarkRemoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? portionRequested,
    TResult Function()? updateRequested,
    TResult Function(Thread bookmark)? bookmarkRemoved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookmarksEventInitialized value) initialized,
    required TResult Function(BookmarksEventPortionRequested value)
        portionRequested,
    required TResult Function(BookmarksEventUpdateRequested value)
        updateRequested,
    required TResult Function(BookmarksEventBookmarkRemoved value)
        bookmarkRemoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookmarksEventInitialized value)? initialized,
    TResult Function(BookmarksEventPortionRequested value)? portionRequested,
    TResult Function(BookmarksEventUpdateRequested value)? updateRequested,
    TResult Function(BookmarksEventBookmarkRemoved value)? bookmarkRemoved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarksEventCopyWith<$Res> {
  factory $BookmarksEventCopyWith(
          BookmarksEvent value, $Res Function(BookmarksEvent) then) =
      _$BookmarksEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$BookmarksEventCopyWithImpl<$Res>
    implements $BookmarksEventCopyWith<$Res> {
  _$BookmarksEventCopyWithImpl(this._value, this._then);

  final BookmarksEvent _value;
  // ignore: unused_field
  final $Res Function(BookmarksEvent) _then;
}

/// @nodoc
abstract class $BookmarksEventInitializedCopyWith<$Res> {
  factory $BookmarksEventInitializedCopyWith(BookmarksEventInitialized value,
          $Res Function(BookmarksEventInitialized) then) =
      _$BookmarksEventInitializedCopyWithImpl<$Res>;
}

/// @nodoc
class _$BookmarksEventInitializedCopyWithImpl<$Res>
    extends _$BookmarksEventCopyWithImpl<$Res>
    implements $BookmarksEventInitializedCopyWith<$Res> {
  _$BookmarksEventInitializedCopyWithImpl(BookmarksEventInitialized _value,
      $Res Function(BookmarksEventInitialized) _then)
      : super(_value, (v) => _then(v as BookmarksEventInitialized));

  @override
  BookmarksEventInitialized get _value =>
      super._value as BookmarksEventInitialized;
}

/// @nodoc
class _$BookmarksEventInitialized implements BookmarksEventInitialized {
  const _$BookmarksEventInitialized();

  @override
  String toString() {
    return 'BookmarksEvent.initialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BookmarksEventInitialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() portionRequested,
    required TResult Function() updateRequested,
    required TResult Function(Thread bookmark) bookmarkRemoved,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? portionRequested,
    TResult Function()? updateRequested,
    TResult Function(Thread bookmark)? bookmarkRemoved,
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
    required TResult Function(BookmarksEventInitialized value) initialized,
    required TResult Function(BookmarksEventPortionRequested value)
        portionRequested,
    required TResult Function(BookmarksEventUpdateRequested value)
        updateRequested,
    required TResult Function(BookmarksEventBookmarkRemoved value)
        bookmarkRemoved,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookmarksEventInitialized value)? initialized,
    TResult Function(BookmarksEventPortionRequested value)? portionRequested,
    TResult Function(BookmarksEventUpdateRequested value)? updateRequested,
    TResult Function(BookmarksEventBookmarkRemoved value)? bookmarkRemoved,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class BookmarksEventInitialized implements BookmarksEvent {
  const factory BookmarksEventInitialized() = _$BookmarksEventInitialized;
}

/// @nodoc
abstract class $BookmarksEventPortionRequestedCopyWith<$Res> {
  factory $BookmarksEventPortionRequestedCopyWith(
          BookmarksEventPortionRequested value,
          $Res Function(BookmarksEventPortionRequested) then) =
      _$BookmarksEventPortionRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class _$BookmarksEventPortionRequestedCopyWithImpl<$Res>
    extends _$BookmarksEventCopyWithImpl<$Res>
    implements $BookmarksEventPortionRequestedCopyWith<$Res> {
  _$BookmarksEventPortionRequestedCopyWithImpl(
      BookmarksEventPortionRequested _value,
      $Res Function(BookmarksEventPortionRequested) _then)
      : super(_value, (v) => _then(v as BookmarksEventPortionRequested));

  @override
  BookmarksEventPortionRequested get _value =>
      super._value as BookmarksEventPortionRequested;
}

/// @nodoc
class _$BookmarksEventPortionRequested
    implements BookmarksEventPortionRequested {
  const _$BookmarksEventPortionRequested();

  @override
  String toString() {
    return 'BookmarksEvent.portionRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BookmarksEventPortionRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() portionRequested,
    required TResult Function() updateRequested,
    required TResult Function(Thread bookmark) bookmarkRemoved,
  }) {
    return portionRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? portionRequested,
    TResult Function()? updateRequested,
    TResult Function(Thread bookmark)? bookmarkRemoved,
    required TResult orElse(),
  }) {
    if (portionRequested != null) {
      return portionRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookmarksEventInitialized value) initialized,
    required TResult Function(BookmarksEventPortionRequested value)
        portionRequested,
    required TResult Function(BookmarksEventUpdateRequested value)
        updateRequested,
    required TResult Function(BookmarksEventBookmarkRemoved value)
        bookmarkRemoved,
  }) {
    return portionRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookmarksEventInitialized value)? initialized,
    TResult Function(BookmarksEventPortionRequested value)? portionRequested,
    TResult Function(BookmarksEventUpdateRequested value)? updateRequested,
    TResult Function(BookmarksEventBookmarkRemoved value)? bookmarkRemoved,
    required TResult orElse(),
  }) {
    if (portionRequested != null) {
      return portionRequested(this);
    }
    return orElse();
  }
}

abstract class BookmarksEventPortionRequested implements BookmarksEvent {
  const factory BookmarksEventPortionRequested() =
      _$BookmarksEventPortionRequested;
}

/// @nodoc
abstract class $BookmarksEventUpdateRequestedCopyWith<$Res> {
  factory $BookmarksEventUpdateRequestedCopyWith(
          BookmarksEventUpdateRequested value,
          $Res Function(BookmarksEventUpdateRequested) then) =
      _$BookmarksEventUpdateRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class _$BookmarksEventUpdateRequestedCopyWithImpl<$Res>
    extends _$BookmarksEventCopyWithImpl<$Res>
    implements $BookmarksEventUpdateRequestedCopyWith<$Res> {
  _$BookmarksEventUpdateRequestedCopyWithImpl(
      BookmarksEventUpdateRequested _value,
      $Res Function(BookmarksEventUpdateRequested) _then)
      : super(_value, (v) => _then(v as BookmarksEventUpdateRequested));

  @override
  BookmarksEventUpdateRequested get _value =>
      super._value as BookmarksEventUpdateRequested;
}

/// @nodoc
class _$BookmarksEventUpdateRequested implements BookmarksEventUpdateRequested {
  const _$BookmarksEventUpdateRequested();

  @override
  String toString() {
    return 'BookmarksEvent.updateRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BookmarksEventUpdateRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() portionRequested,
    required TResult Function() updateRequested,
    required TResult Function(Thread bookmark) bookmarkRemoved,
  }) {
    return updateRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? portionRequested,
    TResult Function()? updateRequested,
    TResult Function(Thread bookmark)? bookmarkRemoved,
    required TResult orElse(),
  }) {
    if (updateRequested != null) {
      return updateRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookmarksEventInitialized value) initialized,
    required TResult Function(BookmarksEventPortionRequested value)
        portionRequested,
    required TResult Function(BookmarksEventUpdateRequested value)
        updateRequested,
    required TResult Function(BookmarksEventBookmarkRemoved value)
        bookmarkRemoved,
  }) {
    return updateRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookmarksEventInitialized value)? initialized,
    TResult Function(BookmarksEventPortionRequested value)? portionRequested,
    TResult Function(BookmarksEventUpdateRequested value)? updateRequested,
    TResult Function(BookmarksEventBookmarkRemoved value)? bookmarkRemoved,
    required TResult orElse(),
  }) {
    if (updateRequested != null) {
      return updateRequested(this);
    }
    return orElse();
  }
}

abstract class BookmarksEventUpdateRequested implements BookmarksEvent {
  const factory BookmarksEventUpdateRequested() =
      _$BookmarksEventUpdateRequested;
}

/// @nodoc
abstract class $BookmarksEventBookmarkRemovedCopyWith<$Res> {
  factory $BookmarksEventBookmarkRemovedCopyWith(
          BookmarksEventBookmarkRemoved value,
          $Res Function(BookmarksEventBookmarkRemoved) then) =
      _$BookmarksEventBookmarkRemovedCopyWithImpl<$Res>;
  $Res call({Thread bookmark});
}

/// @nodoc
class _$BookmarksEventBookmarkRemovedCopyWithImpl<$Res>
    extends _$BookmarksEventCopyWithImpl<$Res>
    implements $BookmarksEventBookmarkRemovedCopyWith<$Res> {
  _$BookmarksEventBookmarkRemovedCopyWithImpl(
      BookmarksEventBookmarkRemoved _value,
      $Res Function(BookmarksEventBookmarkRemoved) _then)
      : super(_value, (v) => _then(v as BookmarksEventBookmarkRemoved));

  @override
  BookmarksEventBookmarkRemoved get _value =>
      super._value as BookmarksEventBookmarkRemoved;

  @override
  $Res call({
    Object? bookmark = freezed,
  }) {
    return _then(BookmarksEventBookmarkRemoved(
      bookmark: bookmark == freezed
          ? _value.bookmark
          : bookmark // ignore: cast_nullable_to_non_nullable
              as Thread,
    ));
  }
}

/// @nodoc
class _$BookmarksEventBookmarkRemoved implements BookmarksEventBookmarkRemoved {
  const _$BookmarksEventBookmarkRemoved({required this.bookmark});

  @override
  final Thread bookmark;

  @override
  String toString() {
    return 'BookmarksEvent.bookmarkRemoved(bookmark: $bookmark)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BookmarksEventBookmarkRemoved &&
            (identical(other.bookmark, bookmark) ||
                const DeepCollectionEquality()
                    .equals(other.bookmark, bookmark)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(bookmark);

  @JsonKey(ignore: true)
  @override
  $BookmarksEventBookmarkRemovedCopyWith<BookmarksEventBookmarkRemoved>
      get copyWith => _$BookmarksEventBookmarkRemovedCopyWithImpl<
          BookmarksEventBookmarkRemoved>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() portionRequested,
    required TResult Function() updateRequested,
    required TResult Function(Thread bookmark) bookmarkRemoved,
  }) {
    return bookmarkRemoved(bookmark);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? portionRequested,
    TResult Function()? updateRequested,
    TResult Function(Thread bookmark)? bookmarkRemoved,
    required TResult orElse(),
  }) {
    if (bookmarkRemoved != null) {
      return bookmarkRemoved(bookmark);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookmarksEventInitialized value) initialized,
    required TResult Function(BookmarksEventPortionRequested value)
        portionRequested,
    required TResult Function(BookmarksEventUpdateRequested value)
        updateRequested,
    required TResult Function(BookmarksEventBookmarkRemoved value)
        bookmarkRemoved,
  }) {
    return bookmarkRemoved(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookmarksEventInitialized value)? initialized,
    TResult Function(BookmarksEventPortionRequested value)? portionRequested,
    TResult Function(BookmarksEventUpdateRequested value)? updateRequested,
    TResult Function(BookmarksEventBookmarkRemoved value)? bookmarkRemoved,
    required TResult orElse(),
  }) {
    if (bookmarkRemoved != null) {
      return bookmarkRemoved(this);
    }
    return orElse();
  }
}

abstract class BookmarksEventBookmarkRemoved implements BookmarksEvent {
  const factory BookmarksEventBookmarkRemoved({required Thread bookmark}) =
      _$BookmarksEventBookmarkRemoved;

  Thread get bookmark => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookmarksEventBookmarkRemovedCopyWith<BookmarksEventBookmarkRemoved>
      get copyWith => throw _privateConstructorUsedError;
}
