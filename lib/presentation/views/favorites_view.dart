import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_app/presentation/providers/favorite/cubit/favorite_cubit.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FavoriteSuccess) {
          return _FavoriteListWidget(state: state);
        }
        return Center(
          child: TextButton(
              onPressed: () {
                context.read<FavoriteCubit>().getFavorites();
              },
              child: const Text('Intente de nuevo')),
        );
      },
    );
  }
}

class _FavoriteListWidget extends StatelessWidget {
  final FavoriteSuccess state;
  const _FavoriteListWidget({
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.listFavoriteTracks.length,
      itemBuilder: (context, index) {
        final favoriteTrack = state.listFavoriteTracks[index];
        return ListTile(
          onTap: () {
            context.go('/home/1/track-detail/${favoriteTrack.track.id}');
          },
          leading: (favoriteTrack.track.imageUrl != null)
              ? SizedBox(
                  width: 50,
                  height: 50,
                  child: CachedNetworkImage(
                    imageUrl: favoriteTrack.track.imageUrl!,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  ),
                )
              : const Icon(Icons.image),
          title: Text(favoriteTrack.track.name ?? 'No name'),
          subtitle: Text(favoriteTrack.track.artist ?? 'No artist'),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              context
                  .read<FavoriteCubit>()
                  .removeFavorite(favoriteTrack.track.id!);
            },
          ),
        );
      },
    );
  }
}
