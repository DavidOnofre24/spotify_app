import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_app/presentation/providers/home/cubit/home_cubit.dart';
import 'package:spotify_app/presentation/widgets/shared/app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomAppBar(),
        ),
      ),
      SliverList(
        delegate: SliverChildListDelegate([
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (state is HomeSuccess) {
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Recomendaciones',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.recommendationsTracks.length,
                      itemBuilder: (context, index) {
                        final track = state.recommendationsTracks[index];
                        return ListTile(
                          leading: (track.imageUrl != null)
                              ? SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CachedNetworkImage(
                                    imageUrl: track.imageUrl!,
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(
                                      Icons.error,
                                      color: Colors.red,
                                    ),
                                  ),
                                )
                              : const Icon(Icons.image),
                          title: Text(track.name ?? 'No name'),
                          subtitle: Text(track.artist ?? 'No artist'),
                          onTap: () {
                            context.go('/home/0/track-detail/${track.id}');
                          },
                        );
                      },
                    ),
                  ],
                );
              }
              return Center(
                child: TextButton(
                    onPressed: () {
                      context.read<HomeCubit>().getRecommendations();
                    },
                    child: const Text('Intente de nuevo')),
              );
            },
          )
        ]),
      )
    ]);
  }
}
