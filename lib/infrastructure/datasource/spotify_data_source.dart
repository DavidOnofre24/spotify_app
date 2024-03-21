import 'package:spotify_app/domain/entities/search_item.dart';
import 'package:spotify_app/domain/entities/user.dart';

abstract class SpotifyDataSource {
  Future<String?> getToken(String code);

  Future<String> getAuthorizationUrl();

  Future<User> getUser(String token);

  Future<List<SearchResultItem>> search(String tokenAccess, String query);
}
