import 'package:spotify_app/domain/repositories/favorites_repository.dart';
import 'package:spotify_app/domain/use_cases/get_token_user_use_case.dart';

class RemoveFavoriteUseCase {
  final FavoriteRepository _favoriteRepository;
  final GetTokenUserUseCase _getTokenUserUseCase;

  RemoveFavoriteUseCase(this._favoriteRepository, this._getTokenUserUseCase);

  Future<bool> execute(String id) async {
    final token = await _getTokenUserUseCase.call();
    if (token == null) {
      throw Exception('Token not found');
    }

    return _favoriteRepository.removeFavorite(token, id);
  }
}
