import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_app/config/dependency_injection/dependency_injection.dart';
import 'package:spotify_app/domain/use_cases/get_token_use_case.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SpotifyWebViewScreen extends StatefulWidget {
  static const name = '/spotify-web-view';
  final String authorizationUrl;

  const SpotifyWebViewScreen({super.key, required this.authorizationUrl});

  @override
  State<SpotifyWebViewScreen> createState() => _SpotifyWebViewScreenState();
}

class _SpotifyWebViewScreenState extends State<SpotifyWebViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Autorización de Spotify'),
      ),
      body: WebView(
        navigationDelegate: (navigation) async {
          if (navigation.url.startsWith('pruebacastor://callback')) {
            if (navigation.url.contains('code=')) {
              final uri = Uri.parse(navigation.url);
              final code = uri.queryParameters['code'];
              await getIt<GetTokenUseCase>().execute(code!);
              Future.delayed(const Duration(seconds: 2), () {
                context.go('/home/0');
              });
            }

            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
        initialUrl: widget.authorizationUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
