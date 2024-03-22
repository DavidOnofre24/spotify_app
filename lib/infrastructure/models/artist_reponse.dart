import 'dart:convert';

class ArtistResponse {
  final ExternalUrls? externalUrls;
  final Followers? followers;
  final List<String>? genres;
  final String? href;
  final String? id;
  final List<Image>? images;
  final String? name;
  final int? popularity;
  final String? type;
  final String? uri;

  ArtistResponse({
    this.externalUrls,
    this.followers,
    this.genres,
    this.href,
    this.id,
    this.images,
    this.name,
    this.popularity,
    this.type,
    this.uri,
  });

  factory ArtistResponse.fromRawJson(String str) =>
      ArtistResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ArtistResponse.fromJson(Map<String, dynamic> json) => ArtistResponse(
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        followers: json["followers"] == null
            ? null
            : Followers.fromJson(json["followers"]),
        genres: json["genres"] == null
            ? []
            : List<String>.from(json["genres"]!.map((x) => x)),
        href: json["href"],
        id: json["id"],
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        name: json["name"],
        popularity: json["popularity"],
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "external_urls": externalUrls?.toJson(),
        "followers": followers?.toJson(),
        "genres":
            genres == null ? [] : List<dynamic>.from(genres!.map((x) => x)),
        "href": href,
        "id": id,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "name": name,
        "popularity": popularity,
        "type": type,
        "uri": uri,
      };
}

class ExternalUrls {
  final String? spotify;

  ExternalUrls({
    this.spotify,
  });

  factory ExternalUrls.fromRawJson(String str) =>
      ExternalUrls.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"],
      );

  Map<String, dynamic> toJson() => {
        "spotify": spotify,
      };
}

class Followers {
  final String? href;
  final int? total;

  Followers({
    this.href,
    this.total,
  });

  factory Followers.fromRawJson(String str) =>
      Followers.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Followers.fromJson(Map<String, dynamic> json) => Followers(
        href: json["href"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "total": total,
      };
}

class Image {
  final String? url;
  final int? height;
  final int? width;

  Image({
    this.url,
    this.height,
    this.width,
  });

  factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
        height: json["height"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "height": height,
        "width": width,
      };
}
