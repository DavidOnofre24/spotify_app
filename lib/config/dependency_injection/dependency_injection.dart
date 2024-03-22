import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:spotify_app/domain/repositories/favorites_repository.dart';
import 'package:spotify_app/domain/repositories/spotify_repository.dart';
import 'package:spotify_app/domain/repositories/storage_repository.dart';
import 'package:spotify_app/domain/use_cases/add_favorite_use_case.dart';
import 'package:spotify_app/domain/use_cases/get_album_by_id_use_case.dart';
import 'package:spotify_app/domain/use_cases/get_favorites_tracks_use_case.dart';
import 'package:spotify_app/domain/use_cases/get_is_favorite_use_case.dart';
import 'package:spotify_app/domain/use_cases/get_recommendations_use_case.dart';
import 'package:spotify_app/domain/use_cases/get_search_items_use_case.dart';
import 'package:spotify_app/domain/use_cases/get_token_use_case.dart';
import 'package:spotify_app/domain/use_cases/get_token_user_use_case.dart';
import 'package:spotify_app/domain/use_cases/get_track_by_id_use_case.dart';
import 'package:spotify_app/domain/use_cases/get_url_authentication_use_case.dart';
import 'package:spotify_app/domain/use_cases/get_user_use_case.dart';
import 'package:spotify_app/domain/use_cases/remove_favorite_use_case.dart';
import 'package:spotify_app/infrastructure/datasource/favorites_data_source.dart';
import 'package:spotify_app/infrastructure/datasource/remote_favorites_data_source.dart';
import 'package:spotify_app/infrastructure/datasource/remote_spotify_data_source.dart';
import 'package:spotify_app/infrastructure/datasource/secure_storage_data_source.dart';
import 'package:spotify_app/infrastructure/datasource/spotify_data_source.dart';
import 'package:spotify_app/infrastructure/repositories/favorites_repository_impl.dart';
import 'package:spotify_app/infrastructure/repositories/spotify_repository_impl.dart';
import 'package:spotify_app/infrastructure/repositories/storage_repository_impl.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  await getIt.reset();
  await dotenv.load(fileName: '.env');
  configureDio();
  configureDatasources();
  configureRepositories();
  configureUseCases();
}

configureDatasources() {
  getIt.registerSingleton<FavoritesDataSource>(
    RemoteFavoritesDataSource(
      dio: getIt<Dio>(),
    ),
  );

  getIt.registerSingleton<SpotifyDataSource>(
    RemoteSpotifyDataSource(
      clientId: dotenv.env['CLIENT_ID']!,
      redirectUri: dotenv.env['REDIRECT_URI']!,
      clientSecret: dotenv.env['CLIENT_SECRET']!,
      dio: getIt<Dio>(),
    ),
  );

  getIt.registerSingleton<SecureStorageDataSource>(SecureStorageDataSource());
}

configureRepositories() {
  getIt.registerSingleton<SpotifyRepository>(SpotifyRepositoryImpl(
    spotifyDataSource: getIt<SpotifyDataSource>(),
    storageDataSource: getIt<SecureStorageDataSource>(),
  ));

  getIt.registerSingleton<StorageRepository>(StorageRepositoryImpl(
    getIt<SecureStorageDataSource>(),
  ));

  getIt.registerSingleton<FavoriteRepository>(FavoritesRepositoryImpl(
    favoritesDataSource: getIt<FavoritesDataSource>(),
  ));
}

configureUseCases() {
  getIt.registerSingleton<GetUserUseCase>(
    GetUserUseCase(getIt<SpotifyRepository>()),
  );
  getIt.registerSingleton<GetUrlAuthenticationUseCase>(
    GetUrlAuthenticationUseCase(getIt<SpotifyRepository>()),
  );

  getIt.registerSingleton<GetTokenUseCase>(
    GetTokenUseCase(getIt<SpotifyRepository>()),
  );

  getIt.registerSingleton<GetTokenUserUseCase>(
    GetTokenUserUseCase(getIt<StorageRepository>()),
  );

  getIt.registerSingleton<GetSearchItemsUseCase>(
    GetSearchItemsUseCase(
      getIt<SpotifyRepository>(),
      getIt<GetTokenUserUseCase>(),
    ),
  );

  getIt.registerSingleton<GetTrackByIdUseCase>(
    GetTrackByIdUseCase(
      getIt<SpotifyRepository>(),
      getIt<GetTokenUserUseCase>(),
    ),
  );

  getIt.registerSingleton<GetFavoritesTracksUseCase>(
    GetFavoritesTracksUseCase(
      getIt<FavoriteRepository>(),
      getIt<GetTokenUserUseCase>(),
    ),
  );

  getIt.registerSingleton<RemoveFavoriteUseCase>(
    RemoveFavoriteUseCase(
      getIt<FavoriteRepository>(),
      getIt<GetTokenUserUseCase>(),
    ),
  );

  getIt.registerSingleton<AddFavoriteUseCase>(
    AddFavoriteUseCase(
      getIt<FavoriteRepository>(),
      getIt<GetTokenUserUseCase>(),
    ),
  );

  getIt.registerSingleton<GetIsFavoriteUseCase>(
    GetIsFavoriteUseCase(
      getIt<FavoriteRepository>(),
      getIt<GetTokenUserUseCase>(),
    ),
  );

  getIt.registerSingleton<GetRecommendationsUseCase>(
    GetRecommendationsUseCase(
      getIt<SpotifyRepository>(),
      getIt<GetTokenUserUseCase>(),
    ),
  );

  getIt.registerSingleton<GetAlbumByIdUseCase>(
    GetAlbumByIdUseCase(
      getIt<SpotifyRepository>(),
      getIt<GetTokenUserUseCase>(),
    ),
  );
}

configureDio() {
  final dio = Dio();
  getIt.registerSingleton<Dio>(dio);
}
