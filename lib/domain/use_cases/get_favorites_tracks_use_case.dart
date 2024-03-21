import 'package:spotify_app/domain/entities/favorite_track.dart';
import 'package:spotify_app/domain/repositories/favorites_repository.dart';
import 'package:spotify_app/domain/use_cases/get_token_user_use_case.dart';

class GetFavoritesTracksUseCase {
  final FavoriteRepository _trackRepository;
  final GetTokenUserUseCase _getTokenUserUseCase;

  GetFavoritesTracksUseCase(this._trackRepository, this._getTokenUserUseCase);

  Future<List<FavoriteTrack>> call() async {
    final token = await _getTokenUserUseCase.call();

    if (token == null) {
      return [];
    }

    return await _trackRepository.getFavorites(token);
  }
}
