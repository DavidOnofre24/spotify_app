import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/presentation/providers/artists/cubit/artist_detail_cubit.dart';

class ArtistDetailScreen extends StatelessWidget {
  static const name = 'artist-detail-screen';
  const ArtistDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: BlocBuilder<ArtistDetailCubit, ArtistDetailState>(
            bloc: context.read<ArtistDetailCubit>(),
            builder: (context, state) {
              if (state is ArtistDetailSuccess) {
                return AppBar(
                  title: Text(state.artist.name),
                );
              }
              return AppBar();
            },
          ),
        ),
        body: BlocBuilder<ArtistDetailCubit, ArtistDetailState>(
            bloc: context.read<ArtistDetailCubit>(),
            builder: (context, state) {
              if (state is ArtistDetailLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ArtistDetailSuccess) {
                return Column(
                  children: [
                    Image.network(
                      state.artist.imageUrl ?? '',
                    ),
                    Text(state.artist.name),
                    Text(state.artist.genres?.first ?? ''),
                    Text(state.artist.popularity.toString()),
                  ],
                );
              }
              return const Center(
                child: Text('Error'),
              );
            }));
  }
}
