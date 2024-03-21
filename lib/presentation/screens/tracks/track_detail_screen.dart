import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/presentation/providers/tracks/cubit/track_detail_cubit.dart';

class TrackDetailScreen extends StatelessWidget {
  static const name = 'track-detail-screen';
  const TrackDetailScreen({super.key});

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
              ),
              body: Center(
                child: Column(
                  children: [
                    Text(state.track.name!),
                    TextButton(
                        onPressed: () {
                          context
                              .read<TrackDetailCubit>()
                              .addFavorite(state.track.id!);
                        },
                        child: const Text('Add to favorite'))
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
