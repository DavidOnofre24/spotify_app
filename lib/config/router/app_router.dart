import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_app/config/dependency_injection/dependency_injection.dart';
import 'package:spotify_app/presentation/providers/favorite/cubit/favorite_cubit.dart';
import 'package:spotify_app/presentation/providers/home/cubit/home_cubit.dart';
import 'package:spotify_app/presentation/providers/tracks/cubit/track_detail_cubit.dart';
import 'package:spotify_app/presentation/screens/albums/album_detail_screen.dart';
import 'package:spotify_app/presentation/screens/screens.dart';
import 'package:spotify_app/presentation/screens/tracks/track_detail_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/spotify-web-view',
      name: SpotifyWebViewScreen.name,
      builder: (context, state) {
        final authorizationUrl =
            ((state.extra as Map<String, dynamic>)['authorizationUrl'] ??
                'defaultUrl') as String;
        return SpotifyWebViewScreen(authorizationUrl: authorizationUrl);
      },
    ),
    GoRoute(
        path: '/home/:pageIndex',
        name: HomeScreen.name,
        builder: (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider<FavoriteCubit>(
                  create: (context) => FavoriteCubit(
                    getFavoritesTracksUseCase: getIt.get(),
                    removeFavoriteUseCase: getIt.get(),
                  ),
                ),
                BlocProvider<HomeCubit>(
                  create: (context) => HomeCubit(
                    getFavoritesTracksUseCase: getIt.get(),
                    getRecommendationsUseCase: getIt.get(),
                  )..getRecommendations(),
                )
              ],
              child: HomeScreen(
                pageIndex: int.parse(state.params['pageIndex'] ?? '0'),
              ),
            ),
        routes: [
          GoRoute(
            path: 'artist-detail/:id',
            name: ArtistDetailScreen.name,
            builder: (context, state) => const ArtistDetailScreen(),
          ),
          GoRoute(
            path: 'track-detail/:id',
            name: TrackDetailScreen.name,
            builder: (context, state) => BlocProvider<TrackDetailCubit>(
              create: (context) => TrackDetailCubit(
                getTrackByIdUseCase: getIt.get(),
                addFavoriteUseCase: getIt.get(),
                getIsFavoriteUseCase: getIt.get(),
                removeFavoriteUseCase: getIt.get(),
              )..getTrackById(state.params['id']!),
              child: const TrackDetailScreen(),
            ),
          ),
          GoRoute(
            path: 'album-detail/:id',
            name: AlbumDetailScreen.name,
            builder: (context, state) => const AlbumDetailScreen(),
          ),
        ]),
  ],
);
