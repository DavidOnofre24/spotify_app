import 'package:spotify_app/domain/entities/favorite_track.dart';
import 'package:spotify_app/domain/repositories/favorites_repository.dart';
import 'package:spotify_app/infrastructure/datasource/favorites_data_source.dart';

class FavoritesRepositoryImpl implements FavoriteRepository {
  final FavoritesDataSource favoritesDataSource;

  FavoritesRepositoryImpl({required this.favoritesDataSource});

  @override
  Future<bool> addFavorite(String token, String id) async {
    return await favoritesDataSource.addFavorite(token, id);
  }

  @override
  Future<bool> removeFavorite(String token, String id) async {
    return await favoritesDataSource.removeFavorite(token, id);
  }

  @override
  Future<List<FavoriteTrack>> getFavorites(String token) async {
    return await favoritesDataSource.getFavorites(token);
  }

  @override
  Future<bool> isFavorite(String token, String id) async {
    return await favoritesDataSource.isFavorite(token, id);
  }
}
