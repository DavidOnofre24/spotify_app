import 'package:spotify_app/domain/repositories/spotify_repository.dart';

class GetTokenUseCase {
  final SpotifyRepository spotifyRepository;
  GetTokenUseCase(this.spotifyRepository);

  Future<String?> execute(String code) {
    return spotifyRepository.getToken(code);
  }
}
