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
                    const SizedBox(
                      height: 20,
                    ),
                    Text(state.album.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(state.album.artists?.toString() ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(state.album.releaseDate ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18)),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Canciones: ',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18)),
                        const Icon(Icons.music_note, size: 18),
                        Text(
                          state.album.totalTracks.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                );
              }
              return const Center(
                child: Text('Error'),
              );
            }));
  }
}
