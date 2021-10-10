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

  BookmarksInitialized bookmarksInitialized() {
    return const BookmarksInitialized();
  }

  BookmarksPortionRequested bookmarksPortionRequested() {
    return const BookmarksPortionRequested();
  }

  BookmarksUpdateRequested bookmarksUpdateRequested() {
    return const BookmarksUpdateRequested();
  }

  BookmarksClearRequested bookmarksClearRequested() {
    return const BookmarksClearRequested();
  }

  BookmarkRemoved bookmarkRemoved({required Thread bookmark}) {
    return BookmarkRemoved(
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
    required TResult Function() bookmarksInitialized,
    required TResult Function() bookmarksPortionRequested,
    required TResult Function() bookmarksUpdateRequested,
    required TResult Function() bookmarksClearRequested,
    required TResult Function(Thread bookmark) bookmarkRemoved,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? bookmarksInitialized,
    TResult Function()? bookmarksPortionRequested,
    TResult Function()? bookmarksUpdateRequested,
    TResult Function()? bookmarksClearRequested,
    TResult Function(Thread bookmark)? bookmarkRemoved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookmarksInitialized value) bookmarksInitialized,
    required TResult Function(BookmarksPortionRequested value) bookmarksPortionRequested,
    required TResult Function(BookmarksUpdateRequested value) bookmarksUpdateRequested,
    required TResult Function(BookmarksClearRequested value) bookmarksClearRequested,
    required TResult Function(BookmarkRemoved value) bookmarkRemoved,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookmarksInitialized value)? bookmarksInitialized,
    TResult Function(BookmarksPortionRequested value)? bookmarksPortionRequested,
    TResult Function(BookmarksUpdateRequested value)? bookmarksUpdateRequested,
    TResult Function(BookmarksClearRequested value)? bookmarksClearRequested,
    TResult Function(BookmarkRemoved value)? bookmarkRemoved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarksEventCopyWith<$Res> {
  factory $BookmarksEventCopyWith(BookmarksEvent value, $Res Function(BookmarksEvent) then) =
      _$BookmarksEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$BookmarksEventCopyWithImpl<$Res> implements $BookmarksEventCopyWith<$Res> {
  _$BookmarksEventCopyWithImpl(this._value, this._then);

  final BookmarksEvent _value;

  // ignore: unused_field
  final $Res Function(BookmarksEvent) _then;
}

/// @nodoc
abstract class $BookmarksInitializedCopyWith<$Res> {
  factory $BookmarksInitializedCopyWith(BookmarksInitialized value, $Res Function(BookmarksInitialized) then) =
      _$BookmarksInitializedCopyWithImpl<$Res>;
}

/// @nodoc
class _$BookmarksInitializedCopyWithImpl<$Res> extends _$BookmarksEventCopyWithImpl<$Res>
    implements $BookmarksInitializedCopyWith<$Res> {
  _$BookmarksInitializedCopyWithImpl(BookmarksInitialized _value, $Res Function(BookmarksInitialized) _then)
      : super(_value, (v) => _then(v as BookmarksInitialized));

  @override
  BookmarksInitialized get _value => super._value as BookmarksInitialized;
}

/// @nodoc
class _$BookmarksInitialized implements BookmarksInitialized {
  const _$BookmarksInitialized();

  @override
  String toString() {
    return 'BookmarksEvent.bookmarksInitialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BookmarksInitialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() bookmarksInitialized,
    required TResult Function() bookmarksPortionRequested,
    required TResult Function() bookmarksUpdateRequested,
    required TResult Function() bookmarksClearRequested,
    required TResult Function(Thread bookmark) bookmarkRemoved,
  }) {
    return bookmarksInitialized();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? bookmarksInitialized,
    TResult Function()? bookmarksPortionRequested,
    TResult Function()? bookmarksUpdateRequested,
    TResult Function()? bookmarksClearRequested,
    TResult Function(Thread bookmark)? bookmarkRemoved,
    required TResult orElse(),
  }) {
    if (bookmarksInitialized != null) {
      return bookmarksInitialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookmarksInitialized value) bookmarksInitialized,
    required TResult Function(BookmarksPortionRequested value) bookmarksPortionRequested,
    required TResult Function(BookmarksUpdateRequested value) bookmarksUpdateRequested,
    required TResult Function(BookmarksClearRequested value) bookmarksClearRequested,
    required TResult Function(BookmarkRemoved value) bookmarkRemoved,
  }) {
    return bookmarksInitialized(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookmarksInitialized value)? bookmarksInitialized,
    TResult Function(BookmarksPortionRequested value)? bookmarksPortionRequested,
    TResult Function(BookmarksUpdateRequested value)? bookmarksUpdateRequested,
    TResult Function(BookmarksClearRequested value)? bookmarksClearRequested,
    TResult Function(BookmarkRemoved value)? bookmarkRemoved,
    required TResult orElse(),
  }) {
    if (bookmarksInitialized != null) {
      return bookmarksInitialized(this);
    }
    return orElse();
  }
}

abstract class BookmarksInitialized implements BookmarksEvent {
  const factory BookmarksInitialized() = _$BookmarksInitialized;
}

/// @nodoc
abstract class $BookmarksPortionRequestedCopyWith<$Res> {
  factory $BookmarksPortionRequestedCopyWith(
          BookmarksPortionRequested value, $Res Function(BookmarksPortionRequested) then) =
      _$BookmarksPortionRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class _$BookmarksPortionRequestedCopyWithImpl<$Res> extends _$BookmarksEventCopyWithImpl<$Res>
    implements $BookmarksPortionRequestedCopyWith<$Res> {
  _$BookmarksPortionRequestedCopyWithImpl(
      BookmarksPortionRequested _value, $Res Function(BookmarksPortionRequested) _then)
      : super(_value, (v) => _then(v as BookmarksPortionRequested));

  @override
  BookmarksPortionRequested get _value => super._value as BookmarksPortionRequested;
}

/// @nodoc
class _$BookmarksPortionRequested implements BookmarksPortionRequested {
  const _$BookmarksPortionRequested();

  @override
  String toString() {
    return 'BookmarksEvent.bookmarksPortionRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BookmarksPortionRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() bookmarksInitialized,
    required TResult Function() bookmarksPortionRequested,
    required TResult Function() bookmarksUpdateRequested,
    required TResult Function() bookmarksClearRequested,
    required TResult Function(Thread bookmark) bookmarkRemoved,
  }) {
    return bookmarksPortionRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? bookmarksInitialized,
    TResult Function()? bookmarksPortionRequested,
    TResult Function()? bookmarksUpdateRequested,
    TResult Function()? bookmarksClearRequested,
    TResult Function(Thread bookmark)? bookmarkRemoved,
    required TResult orElse(),
  }) {
    if (bookmarksPortionRequested != null) {
      return bookmarksPortionRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookmarksInitialized value) bookmarksInitialized,
    required TResult Function(BookmarksPortionRequested value) bookmarksPortionRequested,
    required TResult Function(BookmarksUpdateRequested value) bookmarksUpdateRequested,
    required TResult Function(BookmarksClearRequested value) bookmarksClearRequested,
    required TResult Function(BookmarkRemoved value) bookmarkRemoved,
  }) {
    return bookmarksPortionRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookmarksInitialized value)? bookmarksInitialized,
    TResult Function(BookmarksPortionRequested value)? bookmarksPortionRequested,
    TResult Function(BookmarksUpdateRequested value)? bookmarksUpdateRequested,
    TResult Function(BookmarksClearRequested value)? bookmarksClearRequested,
    TResult Function(BookmarkRemoved value)? bookmarkRemoved,
    required TResult orElse(),
  }) {
    if (bookmarksPortionRequested != null) {
      return bookmarksPortionRequested(this);
    }
    return orElse();
  }
}

abstract class BookmarksPortionRequested implements BookmarksEvent {
  const factory BookmarksPortionRequested() = _$BookmarksPortionRequested;
}

/// @nodoc
abstract class $BookmarksUpdateRequestedCopyWith<$Res> {
  factory $BookmarksUpdateRequestedCopyWith(
          BookmarksUpdateRequested value, $Res Function(BookmarksUpdateRequested) then) =
      _$BookmarksUpdateRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class _$BookmarksUpdateRequestedCopyWithImpl<$Res> extends _$BookmarksEventCopyWithImpl<$Res>
    implements $BookmarksUpdateRequestedCopyWith<$Res> {
  _$BookmarksUpdateRequestedCopyWithImpl(BookmarksUpdateRequested _value, $Res Function(BookmarksUpdateRequested) _then)
      : super(_value, (v) => _then(v as BookmarksUpdateRequested));

  @override
  BookmarksUpdateRequested get _value => super._value as BookmarksUpdateRequested;
}

/// @nodoc
class _$BookmarksUpdateRequested implements BookmarksUpdateRequested {
  const _$BookmarksUpdateRequested();

  @override
  String toString() {
    return 'BookmarksEvent.bookmarksUpdateRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BookmarksUpdateRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() bookmarksInitialized,
    required TResult Function() bookmarksPortionRequested,
    required TResult Function() bookmarksUpdateRequested,
    required TResult Function() bookmarksClearRequested,
    required TResult Function(Thread bookmark) bookmarkRemoved,
  }) {
    return bookmarksUpdateRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? bookmarksInitialized,
    TResult Function()? bookmarksPortionRequested,
    TResult Function()? bookmarksUpdateRequested,
    TResult Function()? bookmarksClearRequested,
    TResult Function(Thread bookmark)? bookmarkRemoved,
    required TResult orElse(),
  }) {
    if (bookmarksUpdateRequested != null) {
      return bookmarksUpdateRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookmarksInitialized value) bookmarksInitialized,
    required TResult Function(BookmarksPortionRequested value) bookmarksPortionRequested,
    required TResult Function(BookmarksUpdateRequested value) bookmarksUpdateRequested,
    required TResult Function(BookmarksClearRequested value) bookmarksClearRequested,
    required TResult Function(BookmarkRemoved value) bookmarkRemoved,
  }) {
    return bookmarksUpdateRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookmarksInitialized value)? bookmarksInitialized,
    TResult Function(BookmarksPortionRequested value)? bookmarksPortionRequested,
    TResult Function(BookmarksUpdateRequested value)? bookmarksUpdateRequested,
    TResult Function(BookmarksClearRequested value)? bookmarksClearRequested,
    TResult Function(BookmarkRemoved value)? bookmarkRemoved,
    required TResult orElse(),
  }) {
    if (bookmarksUpdateRequested != null) {
      return bookmarksUpdateRequested(this);
    }
    return orElse();
  }
}

abstract class BookmarksUpdateRequested implements BookmarksEvent {
  const factory BookmarksUpdateRequested() = _$BookmarksUpdateRequested;
}

/// @nodoc
abstract class $BookmarksClearRequestedCopyWith<$Res> {
  factory $BookmarksClearRequestedCopyWith(BookmarksClearRequested value, $Res Function(BookmarksClearRequested) then) =
      _$BookmarksClearRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class _$BookmarksClearRequestedCopyWithImpl<$Res> extends _$BookmarksEventCopyWithImpl<$Res>
    implements $BookmarksClearRequestedCopyWith<$Res> {
  _$BookmarksClearRequestedCopyWithImpl(BookmarksClearRequested _value, $Res Function(BookmarksClearRequested) _then)
      : super(_value, (v) => _then(v as BookmarksClearRequested));

  @override
  BookmarksClearRequested get _value => super._value as BookmarksClearRequested;
}

/// @nodoc
class _$BookmarksClearRequested implements BookmarksClearRequested {
  const _$BookmarksClearRequested();

  @override
  String toString() {
    return 'BookmarksEvent.bookmarksClearRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BookmarksClearRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() bookmarksInitialized,
    required TResult Function() bookmarksPortionRequested,
    required TResult Function() bookmarksUpdateRequested,
    required TResult Function() bookmarksClearRequested,
    required TResult Function(Thread bookmark) bookmarkRemoved,
  }) {
    return bookmarksClearRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? bookmarksInitialized,
    TResult Function()? bookmarksPortionRequested,
    TResult Function()? bookmarksUpdateRequested,
    TResult Function()? bookmarksClearRequested,
    TResult Function(Thread bookmark)? bookmarkRemoved,
    required TResult orElse(),
  }) {
    if (bookmarksClearRequested != null) {
      return bookmarksClearRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookmarksInitialized value) bookmarksInitialized,
    required TResult Function(BookmarksPortionRequested value) bookmarksPortionRequested,
    required TResult Function(BookmarksUpdateRequested value) bookmarksUpdateRequested,
    required TResult Function(BookmarksClearRequested value) bookmarksClearRequested,
    required TResult Function(BookmarkRemoved value) bookmarkRemoved,
  }) {
    return bookmarksClearRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookmarksInitialized value)? bookmarksInitialized,
    TResult Function(BookmarksPortionRequested value)? bookmarksPortionRequested,
    TResult Function(BookmarksUpdateRequested value)? bookmarksUpdateRequested,
    TResult Function(BookmarksClearRequested value)? bookmarksClearRequested,
    TResult Function(BookmarkRemoved value)? bookmarkRemoved,
    required TResult orElse(),
  }) {
    if (bookmarksClearRequested != null) {
      return bookmarksClearRequested(this);
    }
    return orElse();
  }
}

abstract class BookmarksClearRequested implements BookmarksEvent {
  const factory BookmarksClearRequested() = _$BookmarksClearRequested;
}

/// @nodoc
abstract class $BookmarkRemovedCopyWith<$Res> {
  factory $BookmarkRemovedCopyWith(BookmarkRemoved value, $Res Function(BookmarkRemoved) then) =
      _$BookmarkRemovedCopyWithImpl<$Res>;

  $Res call({Thread bookmark});
}

/// @nodoc
class _$BookmarkRemovedCopyWithImpl<$Res> extends _$BookmarksEventCopyWithImpl<$Res>
    implements $BookmarkRemovedCopyWith<$Res> {
  _$BookmarkRemovedCopyWithImpl(BookmarkRemoved _value, $Res Function(BookmarkRemoved) _then)
      : super(_value, (v) => _then(v as BookmarkRemoved));

  @override
  BookmarkRemoved get _value => super._value as BookmarkRemoved;

  @override
  $Res call({
    Object? bookmark = freezed,
  }) {
    return _then(BookmarkRemoved(
      bookmark: bookmark == freezed
          ? _value.bookmark
          : bookmark // ignore: cast_nullable_to_non_nullable
              as Thread,
    ));
  }
}

/// @nodoc
class _$BookmarkRemoved implements BookmarkRemoved {
  const _$BookmarkRemoved({required this.bookmark});

  @override
  final Thread bookmark;

  @override
  String toString() {
    return 'BookmarksEvent.bookmarkRemoved(bookmark: $bookmark)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BookmarkRemoved &&
            (identical(other.bookmark, bookmark) || const DeepCollectionEquality().equals(other.bookmark, bookmark)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(bookmark);

  @JsonKey(ignore: true)
  @override
  $BookmarkRemovedCopyWith<BookmarkRemoved> get copyWith =>
      _$BookmarkRemovedCopyWithImpl<BookmarkRemoved>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() bookmarksInitialized,
    required TResult Function() bookmarksPortionRequested,
    required TResult Function() bookmarksUpdateRequested,
    required TResult Function() bookmarksClearRequested,
    required TResult Function(Thread bookmark) bookmarkRemoved,
  }) {
    return bookmarkRemoved(bookmark);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? bookmarksInitialized,
    TResult Function()? bookmarksPortionRequested,
    TResult Function()? bookmarksUpdateRequested,
    TResult Function()? bookmarksClearRequested,
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
    required TResult Function(BookmarksInitialized value) bookmarksInitialized,
    required TResult Function(BookmarksPortionRequested value) bookmarksPortionRequested,
    required TResult Function(BookmarksUpdateRequested value) bookmarksUpdateRequested,
    required TResult Function(BookmarksClearRequested value) bookmarksClearRequested,
    required TResult Function(BookmarkRemoved value) bookmarkRemoved,
  }) {
    return bookmarkRemoved(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookmarksInitialized value)? bookmarksInitialized,
    TResult Function(BookmarksPortionRequested value)? bookmarksPortionRequested,
    TResult Function(BookmarksUpdateRequested value)? bookmarksUpdateRequested,
    TResult Function(BookmarksClearRequested value)? bookmarksClearRequested,
    TResult Function(BookmarkRemoved value)? bookmarkRemoved,
    required TResult orElse(),
  }) {
    if (bookmarkRemoved != null) {
      return bookmarkRemoved(this);
    }
    return orElse();
  }
}

abstract class BookmarkRemoved implements BookmarksEvent {
  const factory BookmarkRemoved({required Thread bookmark}) = _$BookmarkRemoved;

  Thread get bookmark => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookmarkRemovedCopyWith<BookmarkRemoved> get copyWith => throw _privateConstructorUsedError;
}
