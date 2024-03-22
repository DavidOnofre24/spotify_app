class AlbumEntity {
  final String id;
  final String name;
  final String? releaseDate;
  final String? imageUrl;
  final int totalTracks;
  final List<String?>? artists;

  AlbumEntity({
    required this.id,
    required this.name,
    required this.releaseDate,
    required this.imageUrl,
    required this.totalTracks,
    required this.artists,
  });
}
