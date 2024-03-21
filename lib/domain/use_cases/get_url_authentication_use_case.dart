import 'package:spotify_app/domain/repositories/spotify_repository.dart';

class GetUrlAuthenticationUseCase {
  final SpotifyRepository _spotifyRepository;

  GetUrlAuthenticationUseCase(this._spotifyRepository);

  String execute() {
    return _spotifyRepository.getAuthorizationUrl();
  }
}
