import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorites_event.freezed.dart';

@freezed
abstract class FavoritesEvent with _$FavoritesEvent {
  const factory FavoritesEvent.initialized() = FavoritesEventInitialized;

  const factory FavoritesEvent.favoritesListWasUpdated() = FavoritesEventFavoritesWasUpdated;
}
