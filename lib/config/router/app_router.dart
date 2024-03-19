import 'package:go_router/go_router.dart';
import 'package:spotify_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    ),
  ],
);
