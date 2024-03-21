import 'package:flutter/material.dart';

class ArtistDetailScreen extends StatelessWidget {
  static const name = 'artist-detail-screen';
  const ArtistDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Artist Detail'),
        ),
        body: const Center(
          child: Text('Artist Detail Screen'),
        ));
  }
}
