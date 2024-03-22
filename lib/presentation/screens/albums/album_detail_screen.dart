import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/presentation/providers/albums/cubit/album_detail_cubit.dart';

class AlbumDetailScreen extends StatelessWidget {
  static const name = 'album-detail-screen';
  const AlbumDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: BlocBuilder<AlbumDetailCubit, AlbumDetailState>(
            bloc: context.read<AlbumDetailCubit>(),
            builder: (context, state) {
              if (state is AlbumDetailSuccess) {
                return AppBar(
                  title: Text(state.album.name),
                );
              }
              return AppBar();
            },
          ),
        ),
        body: BlocBuilder<AlbumDetailCubit, AlbumDetailState>(
            bloc: context.read<AlbumDetailCubit>(),
            builder: (context, state) {
              if (state is AlbumDetailLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is AlbumDetailSuccess) {
                return Column(
                  children: [
                    Image.network(
                      state.album.imageUrl ?? '',
                    ),
                    Text(state.album.name),
                    Text(state.album.artists?.first ?? ''),
                    Text(state.album.releaseDate ?? ''),
                    Text(state.album.totalTracks.toString()),
                  ],
                );
              }
              return const Center(
                child: Text('Error'),
              );
            }));
  }
}
