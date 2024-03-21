class Track {
  final String? id;
  final String? name;
  final String? artist;
  final String? album;
  final String? imageUrl;
  final String? previewUrl;

  Track({
    this.id,
    this.name,
    this.artist,
    this.album,
    this.imageUrl,
    required this.previewUrl,
  });
}
