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
  Future<bool> addFavorite(String token, String id) async {
    final response = await dio.put(
      'https://api.spotify.com/v1/me/tracks?ids=$id',
      data: {
        'ids': [id]
      },
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
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
  Future<bool> removeFavorite(String token, String id) async {
    final response =
        await dio.delete('https://api.spotify.com/v1/me/tracks?ids=$id',
            data: {
              'ids': [id]
            },
            options: Options(headers: {'Authorization': 'Bearer $token'}));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> isFavorite(String token, String id) async {
    final response = await dio.get(
        'https://api.spotify.com/v1/me/tracks/contains?ids=$id',
        options: Options(headers: {'Authorization': 'Bearer $token'}));

    if (response.statusCode == 200) {
      return response.data[0];
    } else {
      throw Exception();
    }
  }
}
