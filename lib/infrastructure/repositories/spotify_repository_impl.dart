import 'package:spotify_app/domain/entities/search_item.dart';
import 'package:spotify_app/domain/entities/track.dart';
import 'package:spotify_app/domain/entities/user.dart';
import 'package:spotify_app/domain/repositories/spotify_repository.dart';
import 'package:spotify_app/infrastructure/datasource/secure_storage_data_source.dart';
import 'package:spotify_app/infrastructure/datasource/spotify_data_source.dart';

class SpotifyRepositoryImpl implements SpotifyRepository {
  final SecureStorageDataSource storageDataSource;
  final SpotifyDataSource spotifyDataSource;

  SpotifyRepositoryImpl({
    required this.spotifyDataSource,
    required this.storageDataSource,
  });

  @override
  Future<String?> getToken(String code) async {
    final token = await spotifyDataSource.getToken(code);
    storageDataSource.saveToken(token ?? '');
    return token;
  }

  @override
  String getAuthorizationUrl() {
    return spotifyDataSource.getAuthorizationUrl();
  }

  @override
  Future<User> getUser(String token) {
    return spotifyDataSource.getUser(token);
  }

  @override
  Future<List<SearchResultItem>> search(String tokenAccess, String query) {
    return spotifyDataSource.search(tokenAccess, query);
  }

  @override
  Future<Track?> getTrackById(String tokenAccess, String id) {
    return spotifyDataSource.getTrackById(tokenAccess, id);
  }

  // @override
  // Future<Album?> getAlbumById(String tokenAccess, String id) {
  //   return spotifyDataSource.getAlbumById(tokenAccess, id);
  // }

  // @override
  // Future<Artist?> getArtistById(String tokenAccess, String id) {
  //   return spotifyDataSource.getArtistById(tokenAccess, id);
  // }
}
