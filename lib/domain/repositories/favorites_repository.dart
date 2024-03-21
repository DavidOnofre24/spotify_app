import 'package:spotify_app/domain/entities/favorite_track.dart';

abstract class FavoriteRepository {
  Future<List<FavoriteTrack>> getFavorites(String token);

  Future<void> addFavorite(String id);

  Future<void> removeFavorite(String id);
}
