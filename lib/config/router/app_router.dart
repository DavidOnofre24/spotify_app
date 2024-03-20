import 'package:go_router/go_router.dart';
import 'package:spotify_app/presentation/screens/auth/spotify_web_view_screen.dart';
import 'package:spotify_app/presentation/screens/home/home_screen.dart';
import 'package:spotify_app/presentation/screens/screens.dart';

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
      path: '/home',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
