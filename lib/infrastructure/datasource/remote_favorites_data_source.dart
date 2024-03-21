import 'package:dio/dio.dart';
import 'package:spotify_app/domain/entities/favorite_track.dart';
import 'package:spotify_app/infrastructure/datasource/favorites_data_source.dart';
import 'package:spotify_app/infrastructure/mappers/favorite_mapper.dart';
import 'package:spotify_app/infrastructure/models/favorites_response.dart';

class RemoteFavoritesDataSource implements FavoritesDataSource {
  final Dio dio;

  RemoteFavoritesDataSource({
    required this.dio,
  });
  @override
  Future<void> addFavorite(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<FavoriteTrack>> getFavorites(String token) async {
    final response = await dio.get(
      'https://api.spotify.com/v1/me/tracks',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );

    if (response.statusCode == 200) {
      final favoritesResponse = FavoritesResponse.fromJson(response.data);
      final list = FavoriteMapper.favoriteResponseToEntity(favoritesResponse);

      return list;
    } else {
      throw Exception();
    }
  }

  @override
  Future<void> removeFavorite(String id) {
    // TODO: implement removeFavorite
    throw UnimplementedError();
  }
}
