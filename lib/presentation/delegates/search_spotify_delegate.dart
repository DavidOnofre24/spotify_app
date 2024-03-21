import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spotify_app/config/dependency_injection/dependency_injection.dart';
import 'package:spotify_app/domain/entities/search_item.dart';
import 'package:spotify_app/domain/use_cases/get_search_items_use_case.dart';

class SearchSpotifyDelegate extends SearchDelegate<String> {
  StreamController<List<SearchResultItem?>> debounceItems =
      StreamController.broadcast();
  StreamController<bool> isLoadingStream = StreamController.broadcast();
  Timer? _debounceTimer;

  void clearStreams() {
    debounceItems.close();
  }

  Widget buildResultsAndSuggestions() {
    return StreamBuilder<List<SearchResultItem?>>(
      initialData: const [],
      stream: debounceItems.stream,
      builder: (context, snapshot) {
        final items = snapshot.data ?? [];

        if (items.isEmpty) {
          return const Center(
            child: Text('Busca por canciones, artistas o álbumes'),
          );
        }

        return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) => ListTile(
                  title: Text(items[index]!.name),
                  subtitle: Text(items[index]!.type),
                ));
      },
    );
  }

  @override
  String get searchFieldLabel => 'Buscar canciones, artistas o álbumes';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildResultsAndSuggestions();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);
    return buildResultsAndSuggestions();
  }

  void _onQueryChanged(String query) {
    isLoadingStream.add(true);

    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      final searchItems = await getIt<GetSearchItemsUseCase>().execute(query);
      debounceItems.add(searchItems);
      isLoadingStream.add(false);
    });
  }
}
