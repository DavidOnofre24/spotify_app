import 'package:spotify_app/domain/entities/album.dart';
import 'package:spotify_app/domain/entities/artist.dart';
import 'package:spotify_app/domain/entities/search_item.dart';
import 'package:spotify_app/domain/entities/track.dart';
import 'package:spotify_app/domain/entities/user.dart';

abstract class SpotifyRepository {
  Future<String?> getToken(String code);

  String getAuthorizationUrl();

  Future<User> getUser(String tokenAccess);

  Future<List<SearchResultItem>> search(
    String tokenAccess,
    String query,
  );

  Future<Track?> getTrackById(String tokenAccess, String id);

  Future<List<Track>> getRecommendations(String tokenAccess, List<String> ids);

  Future<AlbumEntity?> getAlbumById(String tokenAccess, String id);

  Future<ArtistEntity?> getArtistById(String tokenAccess, String id);
}
