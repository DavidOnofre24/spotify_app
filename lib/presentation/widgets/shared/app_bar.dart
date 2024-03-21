import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_app/presentation/delegates/search_spotify_delegate.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Icon(Icons.movie_outlined, color: colors.primary),
                const SizedBox(width: 5),
                Text('Spotify Castor', style: titleStyle),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      showSearch(
                              context: context,
                              delegate: SearchSpotifyDelegate())
                          .then((value) {
                        if (value == null) return;
                        final values = value.split('-');
                        goDetail(context, values[0], values[1]);
                      });
                    },
                    icon: const Icon(Icons.search))
              ],
            ),
          ),
        ));
  }

  void goDetail(BuildContext context, String id, String type) {
    switch (type) {
      case 'track':
        context.go('/home/0/track-detail/$id');
        break;
      case 'artist':
        context.go('/home/0/artist-detail/$id');
        break;
      case 'album':
        context.go('/home/0/album-detail/$id');
        break;
      default:
        break;
    }
  }
}
