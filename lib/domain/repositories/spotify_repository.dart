import 'package:spotify_app/domain/entities/search_item.dart';
import 'package:spotify_app/domain/entities/track.dart';
import 'package:spotify_app/domain/entities/user.dart';

abstract class SpotifyRepository {
  Future<String?> getToken(String code);

  Future<String> getAuthorizationUrl();

  Future<User> getUser(String tokenAccess);

  Future<List<SearchResultItem>> search(
    String tokenAccess,
    String query,
  );

  Future<Track?> getTrackById(String tokenAccess, String id);

  // Future<Album?> getAlbumById(String tokenAccess, String id);

  // Future<Artist?> getArtistById(String tokenAccess, String id);
}
