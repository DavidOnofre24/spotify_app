import 'package:spotify_app/domain/entities/user.dart';

abstract class SpotifyDataSource {
  Future<String?> getToken(String code);

  Future<String> getAuthorizationUrl();

  Future<User> getUser(String token);
}
