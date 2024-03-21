import 'package:spotify_app/domain/entities/favorite_track.dart';
import 'package:spotify_app/domain/entities/track.dart';
import 'package:spotify_app/infrastructure/models/favorites_response.dart';

class FavoriteMapper {
  static List<FavoriteTrack> favoriteResponseToEntity(
      FavoritesResponse response) {
    if (response.items == null) {
      return [];
    }
    return response.items!
        .map((e) => FavoriteTrack(
              track: Track(
                name: e.track!.name,
                album: e.track!.album!.name,
                artist: e.track!.artists!.map((e) => e.name).join(', '),
                imageUrl: e.track!.album!.images!.isNotEmpty
                    ? e.track!.album!.images!.first.url
                    : null,
              ),
              addedAt: e.addedAt ?? DateTime.now(),
            ))
        .toList();
  }
}
