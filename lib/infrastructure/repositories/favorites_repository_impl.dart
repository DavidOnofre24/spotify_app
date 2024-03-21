import 'package:spotify_app/domain/entities/favorite_track.dart';
import 'package:spotify_app/domain/repositories/favorites_repository.dart';
import 'package:spotify_app/infrastructure/datasource/favorites_data_source.dart';

class FavoritesRepositoryImpl implements FavoriteRepository {
  final FavoritesDataSource favoritesDataSource;

  FavoritesRepositoryImpl({required this.favoritesDataSource});

  @override
  Future<void> addFavorite(String id) async {
    await favoritesDataSource.addFavorite(id);
  }

  @override
  Future<void> removeFavorite(String id) async {
    await favoritesDataSource.removeFavorite(id);
  }

  @override
  Future<List<FavoriteTrack>> getFavorites(String token) async {
    return await favoritesDataSource.getFavorites(token);
  }
}
