import 'package:spotify_app/domain/entities/favorite_track.dart';

abstract class FavoritesDataSource {
  Future<bool> addFavorite(String token, String id);

  Future<bool> removeFavorite(String token, String id);

  Future<List<FavoriteTrack>> getFavorites(String token);
}
