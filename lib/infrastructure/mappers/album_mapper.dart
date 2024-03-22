import 'package:spotify_app/domain/entities/album.dart';
import 'package:spotify_app/infrastructure/models/album_response.dart';

class AlbumMapper {
  static AlbumEntity albumResponseToEntity(AlbumResponse albumResponse) {
    return AlbumEntity(
      id: albumResponse.id!,
      name: albumResponse.name!,
      releaseDate: albumResponse.releaseDate,
      totalTracks: albumResponse.totalTracks ?? 0,
      imageUrl: albumResponse.images?.isNotEmpty ?? false
          ? albumResponse.images!.first.url
          : null,
      artists: albumResponse.artists?.map((artist) => artist.name).toList(),
    );
  }
}
