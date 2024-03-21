import 'package:spotify_app/domain/entities/track.dart';
import 'package:spotify_app/domain/repositories/spotify_repository.dart';
import 'package:spotify_app/domain/use_cases/get_token_user_use_case.dart';

class GetTrackByIdUseCase {
  final SpotifyRepository _spotifyRepository;
  final GetTokenUserUseCase _getTokenUseCase;

  GetTrackByIdUseCase(this._spotifyRepository, this._getTokenUseCase);

  Future<Track?> execute(String id) async {
    final token = await _getTokenUseCase.call();
    if (token == null) {
      throw Exception('Token not found');
    }
    return await _spotifyRepository.getTrackById(token, id);
  }
}
