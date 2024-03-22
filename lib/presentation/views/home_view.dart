import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is HomeSuccess) {
                return Column(
                  children: [
                    const Text(
                      'Recomendaciones',
                      style: TextStyle(fontSize: 20),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.recommendationsTracks.length,
                      itemBuilder: (context, index) {
                        final track = state.recommendationsTracks[index];
                        return ListTile(
                          title: Text(track.name ?? 'No name'),
                          subtitle: Text(track.artist ?? 'No artist'),
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
