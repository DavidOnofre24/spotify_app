import 'package:spotify_app/domain/entities/search_item.dart';
import 'package:spotify_app/domain/repositories/spotify_repository.dart';
import 'package:spotify_app/domain/use_cases/get_token_user_use_case.dart';

class GetSearchItemsUseCase {
  final SpotifyRepository _spotifyRepository;
  final GetTokenUserUseCase _getTokenUseCase;

  GetSearchItemsUseCase(this._spotifyRepository, this._getTokenUseCase);

  Future<List<SearchResultItem?>> execute(String query) async {
    final token = await _getTokenUseCase.call();
    if (token == null) {
      return [];
    }
    return _spotifyRepository.search(token, query);
  }
}
