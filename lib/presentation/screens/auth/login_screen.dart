import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_app/config/dependency_injection/dependency_injection.dart';
import 'package:spotify_app/domain/use_cases/get_url_authentication_use_case.dart';
import 'package:spotify_app/presentation/screens/auth/spotify_web_view_screen.dart';

class LoginScreen extends StatelessWidget {
  static const name = 'login-screen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () async {
              var url = await getIt<GetUrlAuthenticationUseCase>().execute();
              navigateToSpotifyWebView(context, url);
            },
            child: const Text('Login with Spotify')),
      ),
    );
  }

  void navigateToSpotifyWebView(BuildContext context, String authorizationUrl) {
    context.go(SpotifyWebViewScreen.name,
        extra: {'authorizationUrl': authorizationUrl});
  }
}
