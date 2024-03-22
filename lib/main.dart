import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotify_app/config/dependency_injection/dependency_injection.dart';
import 'package:spotify_app/config/theme/app_theme.dart';

import 'config/router/app_router.dart';

void main() async {
  await setupDependencyInjection();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Spotify App',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
