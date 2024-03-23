import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:spotify_app/infrastructure/datasource/login_data_source.dart';
import 'package:spotify_app/presentation/screens/auth/login_screen.dart';

class AndroidLoginDataSource implements LoginDataSource {
  final FlutterAppAuth flutterAppAuth;

  AndroidLoginDataSource(
    this.flutterAppAuth,
  );

  @override
  Future<String?> getToken() async {
    final response = await appAuth.authorizeAndExchangeCode(
      AuthorizationTokenRequest(
        'e70684a3862e4fab8bd4a06bdfb01d73',
        'com.davidonofre.spotifyapp://callback',
        clientSecret: 'da4b98d9faa045ca85742b21609863f9',
        serviceConfiguration: const AuthorizationServiceConfiguration(
          authorizationEndpoint: 'https://accounts.spotify.com/authorize',
          tokenEndpoint: 'https://accounts.spotify.com/api/token',
        ),
        scopes: [
          'user-read-private',
          'user-read-email',
          'user-library-read',
          'user-top-read',
          'user-read-recently-played',
          'user-read-playback-state',
          'user-modify-playback-state',
          'user-read-currently-playing',
          'user-library-modify'
        ],
      ),
    );

    return response?.accessToken;
  }
}
