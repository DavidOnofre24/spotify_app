class SearchResultItem {
  final String id;
  final String name;
  final String type; // 'album', 'artist', 'track' etc.
  final String? imageUrl;

  SearchResultItem({
    required this.id,
    required this.name,
    required this.type,
    this.imageUrl,
  });
}

class Albums {
  final List<SearchResultItem> items;

  Albums({required this.items});
}

class Artists {
  final List<SearchResultItem> items;

  Artists({required this.items});
}

class Tracks {
  final List<SearchResultItem> items;

  Tracks({required this.items});
}
