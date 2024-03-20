import 'package:spotify_app/domain/repositories/spotify_repository.dart';

class GetUrlAuthenticationUseCase {
  final SpotifyRepository _spotifyRepository;

  GetUrlAuthenticationUseCase(this._spotifyRepository);

  Future<String> execute() async {
    return await _spotifyRepository.getAuthorizationUrl();
  }
}
