import 'package:spotify_app/domain/entities/track.dart';
import 'package:spotify_app/domain/repositories/spotify_repository.dart';
import 'package:spotify_app/domain/use_cases/get_token_user_use_case.dart';

class GetRecommendationsUseCase {
  final SpotifyRepository _spotifyRepository;
  final GetTokenUserUseCase _getTokenUserUseCase;

  GetRecommendationsUseCase(
    this._spotifyRepository,
    this._getTokenUserUseCase,
  );

  Future<List<Track>> call(List<String> ids) async {
    final token = await _getTokenUserUseCase.call();
    if (token == null) {
      throw Exception('Token not found');
    }
    return await _spotifyRepository.getRecommendations(token, ids);
  }
}
