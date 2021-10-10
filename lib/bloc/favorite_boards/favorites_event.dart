import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorites_event.freezed.dart';

@freezed
abstract class FavoritesEvent with _$FavoritesEvent {
  const factory FavoritesEvent.favoritesInitialized() = FavoritesInitialized;

  const factory FavoritesEvent.favoritesWasUpdated() = FavoritesWasUpdated;
}
