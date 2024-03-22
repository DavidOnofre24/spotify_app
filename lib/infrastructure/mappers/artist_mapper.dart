import 'package:spotify_app/domain/entities/artist.dart';
import 'package:spotify_app/infrastructure/models/artist_reponse.dart';

class ArtistMapper {
  static ArtistEntity artistResponseToEntity(ArtistResponse artistResponse) {
    return ArtistEntity(
      id: artistResponse.id!,
      name: artistResponse.name!,
      popularity: artistResponse.popularity ?? 0,
      imageUrl: artistResponse.images?.isNotEmpty ?? false
          ? artistResponse.images!.first.url
          : null,
      genres: artistResponse.genres,
    );
  }
}
