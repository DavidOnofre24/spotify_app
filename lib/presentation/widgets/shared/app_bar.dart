import 'package:flutter/material.dart';
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
                          context: context, delegate: SearchSpotifyDelegate());
                    },
                    icon: const Icon(Icons.search))
              ],
            ),
          ),
        ));
  }
}
