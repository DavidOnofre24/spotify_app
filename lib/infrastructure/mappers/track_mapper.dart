import 'package:spotify_app/domain/entities/track.dart';
import 'package:spotify_app/infrastructure/models/track_response.dart';

class TrackMapper {
  static Track trackResponseToEntity(TrackResponse trackResponse) {
    {
      return Track(
        name: trackResponse.name,
        artist: trackResponse.artists?[0].name,
        album: trackResponse.album?.name,
        imageUrl: trackResponse.album?.images?[0].url,
      );
    }
  }
}
