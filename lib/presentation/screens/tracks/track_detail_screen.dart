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
    return BlocBuilder<TrackDetailCubit, TrackDetailState>(
        bloc: context.read<TrackDetailCubit>(),
        builder: (context, state) {
          if (state is TrackDetailLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (state is TrackDetailSuccess) {
            return Scaffold(
              appBar: AppBar(
                title: Text(state.track.name!),
                actions: [
                  IconButton(
                    onPressed: () {
                      context
                          .read<TrackDetailCubit>()
                          .toggleFavorite(state.track.id!);
                    },
                    icon: Icon(
                      state.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.green,
                      size: 32,
                    ),
                  ),
                ],
              ),
              body: Center(
                child: Column(
                  children: [
                    Text(state.track.name!),
                    if (state.track.previewUrl != null)
                      PlayerWidget(
                        player: player
                          ..setUrl(
                            state.track.previewUrl!,
                          ),
                      ),
                  ],
                ),
              ),
            );
          }

          if (state is TrackDetailFailure) {
            return const Scaffold(
              body: Center(
                child: Text('Failed to load track'),
              ),
            );
          }

          return const Scaffold(
            body: Center(
              child: Text('Failed to load track'),
            ),
          );
        });
  }
}
