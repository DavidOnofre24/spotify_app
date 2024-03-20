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
  Future<String> getAuthorizationUrl() {
    return spotifyDataSource.getAuthorizationUrl();
  }

  @override
  Future<User> getUser(String token) {
    return spotifyDataSource.getUser(token);
  }
}
