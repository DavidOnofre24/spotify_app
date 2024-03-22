import 'package:spotify_app/domain/entities/album.dart';
import 'package:spotify_app/domain/repositories/spotify_repository.dart';
import 'package:spotify_app/domain/use_cases/get_token_user_use_case.dart';

class GetAlbumByIdUseCase {
  final SpotifyRepository _spotifyRepository;
  final GetTokenUserUseCase _getTokenUserUseCase;

  GetAlbumByIdUseCase(this._spotifyRepository, this._getTokenUserUseCase);

  Future<AlbumEntity?> execute(String id) async {
    final token = await _getTokenUserUseCase.call();
    if (token == null) {
      throw Exception('Token not found');
    }

    return await _spotifyRepository.getAlbumById(token, id);
  }
}
