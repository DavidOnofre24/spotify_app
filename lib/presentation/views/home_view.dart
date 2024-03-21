import 'package:flutter/material.dart';
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
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text('Hola'),
          )
        ]),
      )
    ]);
  }
}
