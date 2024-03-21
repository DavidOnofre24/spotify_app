import 'package:flutter/material.dart';
import 'package:spotify_app/presentation/views/favorites_view.dart';
import 'package:spotify_app/presentation/views/home_view.dart';
import 'package:spotify_app/presentation/widgets/shared/bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  final int pageIndex;
  const HomeScreen({super.key, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: const [
          HomeView(),
          FavoritesView(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigation(currentIndex: pageIndex),
    );
  }
}
