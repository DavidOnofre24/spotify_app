import 'package:spotify_app/domain/entities/track.dart';

class FavoriteTrack {
  final Track track;
  final DateTime addedAt;

  FavoriteTrack({
    required this.track,
    required this.addedAt,
  });
}
