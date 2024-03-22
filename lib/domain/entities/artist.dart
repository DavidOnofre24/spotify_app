class ArtistEntity {
  final String id;
  final String name;
  final String? imageUrl;
  final List<String>? genres;
  final int popularity;

  ArtistEntity({
    required this.id,
    required this.name,
    required this.popularity,
    required this.genres,
    required this.imageUrl,
  });
}
