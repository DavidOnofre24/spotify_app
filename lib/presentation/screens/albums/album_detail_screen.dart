import 'package:flutter/material.dart';

class AlbumDetailScreen extends StatelessWidget {
  static const name = 'album-detail-screen';
  const AlbumDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('album Detail'),
        ),
        body: const Center(
          child: Text('album Detail Screen'),
        ));
  }
}
