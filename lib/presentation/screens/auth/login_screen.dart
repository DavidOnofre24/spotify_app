import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_app/config/dependency_injection/dependency_injection.dart';
import 'package:spotify_app/domain/use_cases/get_android_token_use_case.dart';
import 'package:spotify_app/domain/use_cases/get_url_authentication_use_case.dart';
import 'package:spotify_app/presentation/screens/auth/spotify_web_view_screen.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

const FlutterAppAuth appAuth = FlutterAppAuth();

class LoginScreen extends StatelessWidget {
  static const name = 'login-screen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/spotify_white.png',
                width: double.infinity,
              ),
              const SizedBox(height: 50),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  padding: const EdgeInsets.all(15),
                  color: Colors.green,
                  onPressed: () async {
                    if (Platform.isIOS) {
                      final url =
                          getIt<GetUrlAuthenticationUseCase>().execute();
                      navigateToSpotifyWebView(context, url);
                    } else {
                      await getIt<GetAndroidTokenUseCase>().call();
                      Future.delayed(const Duration(seconds: 2), () {
                        context.go('/home/0');
                      });
                    }
                  },
                  child: const Text('Iniciar sesión con Spotify',
                      style: TextStyle(color: Colors.white, fontSize: 18))),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToSpotifyWebView(BuildContext context, String authorizationUrl) {
    context.go(SpotifyWebViewScreen.name,
        extra: {'authorizationUrl': authorizationUrl});
  }
}
