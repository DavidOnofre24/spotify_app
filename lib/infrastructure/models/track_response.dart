import 'dart:convert';

class TrackResponse {
  final Album? album;
  final List<Artist>? artists;
  final List<dynamic>? availableMarkets;
  final int? discNumber;
  final int? durationMs;
  final bool? explicit;
  final ExternalIds? externalIds;
  final ExternalUrls? externalUrls;
  final String? href;
  final String? id;
  final bool? isLocal;
  final String? name;
  final int? popularity;
  final dynamic previewUrl;
  final int? trackNumber;
  final String? type;
  final String? uri;

  TrackResponse({
    this.album,
    this.artists,
    this.availableMarkets,
    this.discNumber,
    this.durationMs,
    this.explicit,
    this.externalIds,
    this.externalUrls,
    this.href,
    this.id,
    this.isLocal,
    this.name,
    this.popularity,
    this.previewUrl,
    this.trackNumber,
    this.type,
    this.uri,
  });

  factory TrackResponse.fromRawJson(String str) =>
      TrackResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TrackResponse.fromJson(Map<String, dynamic> json) => TrackResponse(
        album: json["album"] == null ? null : Album.fromJson(json["album"]),
        artists: json["artists"] == null
            ? []
            : List<Artist>.from(
                json["artists"]!.map((x) => Artist.fromJson(x))),
        availableMarkets: json["available_markets"] == null
            ? []
            : List<dynamic>.from(json["available_markets"]!.map((x) => x)),
        discNumber: json["disc_number"],
        durationMs: json["duration_ms"],
        explicit: json["explicit"],
        externalIds: json["external_ids"] == null
            ? null
            : ExternalIds.fromJson(json["external_ids"]),
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        isLocal: json["is_local"],
        name: json["name"],
        popularity: json["popularity"],
        previewUrl: json["preview_url"],
        trackNumber: json["track_number"],
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "artists": artists == null
            ? []
            : List<dynamic>.from(artists!.map((x) => x.toJson())),
        "available_markets": availableMarkets == null
            ? []
            : List<dynamic>.from(availableMarkets!.map((x) => x)),
        "disc_number": discNumber,
        "duration_ms": durationMs,
        "explicit": explicit,
        "external_ids": externalIds?.toJson(),
        "external_urls": externalUrls?.toJson(),
        "href": href,
        "id": id,
        "is_local": isLocal,
        "name": name,
        "popularity": popularity,
        "preview_url": previewUrl,
        "track_number": trackNumber,
        "type": type,
        "uri": uri,
      };
}

class Album {
  final String? albumType;
  final List<Artist>? artists;
  final List<dynamic>? availableMarkets;
  final ExternalUrls? externalUrls;
  final String? href;
  final String? id;
  final List<Image>? images;
  final String? name;
  final String? releaseDate;
  final String? releaseDatePrecision;
  final int? totalTracks;
  final String? type;
  final String? uri;

  Album({
    this.albumType,
    this.artists,
    this.availableMarkets,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    this.releaseDate,
    this.releaseDatePrecision,
    this.totalTracks,
    this.type,
    this.uri,
  });

  factory Album.fromRawJson(String str) => Album.fromJson(json.decode(str));

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        albumType: json["album_type"],
        artists: json["artists"] == null
            ? []
            : List<Artist>.from(
                json["artists"]!.map((x) => Artist.fromJson(x))),
        availableMarkets: json["available_markets"] == null
            ? []
            : List<dynamic>.from(json["available_markets"]!.map((x) => x)),
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        name: json["name"],
        releaseDate: json["release_date"],
        releaseDatePrecision: json["release_date_precision"],
        totalTracks: json["total_tracks"],
        type: json["type"],
        uri: json["uri"],
      );
}

class Artist {
  final ExternalUrls? externalUrls;
  final String? href;
  final String? id;
  final String? name;
  final String? type;
  final String? uri;

  Artist({
    this.externalUrls,
    this.href,
    this.id,
    this.name,
    this.type,
    this.uri,
  });

  factory Artist.fromRawJson(String str) => Artist.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        name: json["name"],
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "external_urls": externalUrls?.toJson(),
        "href": href,
        "id": id,
        "name": name,
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

class Image {
  final int? height;
  final String? url;
  final int? width;

  Image({
    this.height,
    this.url,
    this.width,
  });

  factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        height: json["height"],
        url: json["url"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "url": url,
        "width": width,
      };
}

class ExternalIds {
  final String? isrc;

  ExternalIds({
    this.isrc,
  });

  factory ExternalIds.fromRawJson(String str) =>
      ExternalIds.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds(
        isrc: json["isrc"],
      );

  Map<String, dynamic> toJson() => {
        "isrc": isrc,
      };
}
