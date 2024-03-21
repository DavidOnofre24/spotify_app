import 'package:flutter/material.dart';
import 'package:spotify_app/config/dependency_injection/dependency_injection.dart';
import 'package:spotify_app/domain/entities/user.dart';
import 'package:spotify_app/domain/use_cases/get_token_user_use_case.dart';
import 'package:spotify_app/domain/use_cases/get_user_use_case.dart';
import 'package:spotify_app/presentation/widgets/shared/app_bar.dart';

class HomeScreen extends StatefulWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final token = await getIt<GetTokenUserUseCase>().call();
      if (token != null) {
        final a = await getIt<GetUserUseCase>().execute(token);
        setState(() {
          user = a;
        });
      }
    });
  }

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
