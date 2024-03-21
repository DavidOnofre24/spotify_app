import 'package:spotify_app/domain/entities/favorite_track.dart';

abstract class FavoritesDataSource {
  Future<void> addFavorite(String id);

  Future<void> removeFavorite(String id);

  Future<List<FavoriteTrack>> getFavorites(String token);
}
