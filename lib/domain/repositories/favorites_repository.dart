import 'package:spotify_app/domain/entities/favorite_track.dart';

abstract class FavoriteRepository {
  Future<List<FavoriteTrack>> getFavorites(String token);

  Future<bool> addFavorite(String token, String id);

  Future<bool> removeFavorite(String token, String id);

  Future<bool> isFavorite(String token, String id);
}
