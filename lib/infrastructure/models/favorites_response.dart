import 'dart:convert';

class FavoritesResponse {
  final String? href;
  final List<Item>? items;
  final int? limit;
  final String? next;
  final int? offset;
  final dynamic previous;
  final int? total;

  FavoritesResponse({
    this.href,
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  factory FavoritesResponse.fromRawJson(String str) =>
      FavoritesResponse.fromJson(json.decode(str));

  factory FavoritesResponse.fromJson(Map<String, dynamic> json) =>
      FavoritesResponse(
        href: json["href"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
      );
}

class Item {
  final DateTime? addedAt;
  final TrackR? track;

  Item({
    this.addedAt,
    this.track,
  });

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        addedAt:
            json["added_at"] == null ? null : DateTime.parse(json["added_at"]),
        track: json["track"] == null ? null : TrackR.fromJson(json["track"]),
      );
}

class TrackR {
  final Album? album;
  final List<Artist>? artists;
  final List<String>? availableMarkets;
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
  final String? previewUrl;
  final int? trackNumber;
  final TrackType? type;
  final String? uri;

  TrackR({
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

  factory TrackR.fromRawJson(String str) => TrackR.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TrackR.fromJson(Map<String, dynamic> json) => TrackR(
        album: json["album"] == null ? null : Album.fromJson(json["album"]),
        artists: json["artists"] == null
            ? []
            : List<Artist>.from(
                json["artists"]!.map((x) => Artist.fromJson(x))),
        availableMarkets: json["available_markets"] == null
            ? []
            : List<String>.from(json["available_markets"]!.map((x) => x)),
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
        type: trackTypeValues.map[json["type"]],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "album": album?.toJson(),
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
        "type": trackTypeValues.reverse[type],
        "uri": uri,
      };
}

class Album {
  final AlbumTypeEnum? albumType;
  final List<Artist>? artists;
  final List<String>? availableMarkets;
  final ExternalUrls? externalUrls;
  final String? href;
  final String? id;
  final List<Image>? images;
  final String? name;
  final String? releaseDate;
  final ReleaseDatePrecision? releaseDatePrecision;
  final int? totalTracks;
  final AlbumTypeEnum? type;
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

  String toRawJson() => json.encode(toJson());

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        albumType: albumTypeEnumValues.map[json["album_type"]],
        artists: json["artists"] == null
            ? []
            : List<Artist>.from(
                json["artists"]!.map((x) => Artist.fromJson(x))),
        availableMarkets: json["available_markets"] == null
            ? []
            : List<String>.from(json["available_markets"]!.map((x) => x)),
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
        releaseDatePrecision:
            releaseDatePrecisionValues.map[json["release_date_precision"]],
        totalTracks: json["total_tracks"],
        type: albumTypeEnumValues.map[json["type"]],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "album_type": albumTypeEnumValues.reverse[albumType],
        "artists": artists == null
            ? []
            : List<dynamic>.from(artists!.map((x) => x.toJson())),
        "available_markets": availableMarkets == null
            ? []
            : List<dynamic>.from(availableMarkets!.map((x) => x)),
        "external_urls": externalUrls?.toJson(),
        "href": href,
        "id": id,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "name": name,
        "release_date": "",
        "release_date_precision":
            releaseDatePrecisionValues.reverse[releaseDatePrecision],
        "total_tracks": totalTracks,
        "type": albumTypeEnumValues.reverse[type],
        "uri": uri,
      };
}

enum AlbumTypeEnum { album, compilation, single }

final albumTypeEnumValues = EnumValues({
  "album": AlbumTypeEnum.album,
  "compilation": AlbumTypeEnum.compilation,
  "single": AlbumTypeEnum.single
});

class Artist {
  final ExternalUrls? externalUrls;
  final String? href;
  final String? id;
  final String? name;
  final ArtistType? type;
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
        type: artistTypeValues.map[json["type"]]!,
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "external_urls": externalUrls?.toJson(),
        "href": href,
        "id": id,
        "name": name,
        "type": artistTypeValues.reverse[type],
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

enum ArtistType { artist }

final artistTypeValues = EnumValues({"artist": ArtistType.artist});

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

enum ReleaseDatePrecision { day }

final releaseDatePrecisionValues =
    EnumValues({"day": ReleaseDatePrecision.day});

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

enum TrackType { track }

final trackTypeValues = EnumValues({"track": TrackType.track});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
