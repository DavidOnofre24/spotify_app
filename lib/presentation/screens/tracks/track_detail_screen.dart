import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/presentation/providers/tracks/cubit/track_detail_cubit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:spotify_app/presentation/widgets/player_widget.dart';

class TrackDetailScreen extends StatefulWidget {
  static const name = 'track-detail-screen';
  const TrackDetailScreen({super.key});

  @override
  State<TrackDetailScreen> createState() => _TrackDetailScreenState();
}

class _TrackDetailScreenState extends State<TrackDetailScreen> {
  AudioPlayer player = AudioPlayer();

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: BlocBuilder<TrackDetailCubit, TrackDetailState>(
            bloc: context.read<TrackDetailCubit>(),
            builder: (context, state) {
              if (state is TrackDetailSuccess) {
                return AppBar(
                  title: Text(state.track.name!),
                  actions: [
                    IconButton(
                      icon: Icon(state.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border),
                      onPressed: () {
                        context
                            .read<TrackDetailCubit>()
                            .toggleFavorite(state.track.id!);
                      },
                    ),
                  ],
                );
              }
              return AppBar();
            },
          ),
        ),
        body: SafeArea(
          top: false,
          child: BlocBuilder<TrackDetailCubit, TrackDetailState>(
              bloc: context.read<TrackDetailCubit>(),
              builder: (context, state) {
                if (state is TrackDetailLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is TrackDetailSuccess) {
                  return Center(
                    child: Column(
                      children: [
                        CachedNetworkImage(
                            imageUrl: state.track.imageUrl!,
                            width: double.infinity),
                        const SizedBox(height: 20),
                        Text(state.track.name!,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        Text(state.track.artist ?? '',
                            style: const TextStyle(fontSize: 18)),
                        const SizedBox(height: 20),
                        if (state.track.previewUrl != null)
                          PlayerWidget(
                            player: player
                              ..setUrl(
                                state.track.previewUrl!,
                              ),
                          ),
                      ],
                    ),
                  );
                }

                if (state is TrackDetailFailure) {
                  return const Center(
                    child: Text('Failed to load track'),
                  );
                }

                return const SizedBox();
              }),
        ));
  }
}
