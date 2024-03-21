import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/presentation/providers/favorite/cubit/favorite_cubit.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FavoriteSuccess) {
          return ListView.builder(
            itemCount: state.listFavoriteTracks.length,
            itemBuilder: (context, index) {
              final favoriteTrack = state.listFavoriteTracks[index];
              return ListTile(
                title: Text(favoriteTrack.track.name ?? 'No name'),
                subtitle: Text(favoriteTrack.track.artist ?? 'No artist'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    // context.read<FavoriteCubit>().removeFavorite(favoriteTrack);
                  },
                ),
              );
            },
          );
        } else {
          return Center(
            child: TextButton(
                onPressed: () {
                  context.read<FavoriteCubit>().getFavorites();
                },
                child: const Text('Try again')),
          );
        }
      },
    );
  }
}
