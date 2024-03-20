import 'package:spotify_app/domain/entities/user.dart';
import 'package:spotify_app/domain/repositories/spotify_repository.dart';

class GetUserUseCase {
  final SpotifyRepository _spotifyRepository;

  GetUserUseCase(this._spotifyRepository);

  Future<User> execute(String tokenAccess) async {
    return _spotifyRepository.getUser(tokenAccess);
  }
}
