import 'dart:convert';

class SearchResponse {
  final Albums? albums;
  final Artists? artists;
  final Tracks? tracks;

  SearchResponse({
    this.albums,
    this.artists,
    this.tracks,
  });

  factory SearchResponse.fromRawJson(String str) =>
      SearchResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        albums: json["albums"] == null ? null : Albums.fromJson(json["albums"]),
        artists:
            json["artists"] == null ? null : Artists.fromJson(json["artists"]),
        tracks: json["tracks"] == null ? null : Tracks.fromJson(json["tracks"]),
      );

  Map<String, dynamic> toJson() => {
        "albums": albums?.toJson(),
        "artists": artists?.toJson(),
        "tracks": tracks?.toJson(),
      };
}

class Albums {
  final String? href;
  final List<AlbumElement>? items;
  final int? limit;
  final String? next;
  final int? offset;
  final dynamic previous;
  final int? total;

  Albums({
    this.href,
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  factory Albums.fromRawJson(String str) => Albums.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Albums.fromJson(Map<String, dynamic> json) => Albums(
        href: json["href"],
        items: json["items"] == null
            ? []
            : List<AlbumElement>.from(
                json["items"]!.map((x) => AlbumElement.fromJson(x))),
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
      };
}

class AlbumElement {
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

  AlbumElement({
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

  factory AlbumElement.fromRawJson(String str) =>
      AlbumElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AlbumElement.fromJson(Map<String, dynamic> json) => AlbumElement(
        albumType:
            albumTypeEnumValues.map[json["album_type"]] ?? AlbumTypeEnum.album,
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
            releaseDatePrecisionValues.map[json["release_date_precision"]]!,
        totalTracks: json["total_tracks"],
        type: albumTypeEnumValues.map[json["type"]]!,
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
        "release_date": releaseDate,
        "release_date_precision":
            releaseDatePrecisionValues.reverse[releaseDatePrecision],
        "total_tracks": totalTracks,
        "type": albumTypeEnumValues.reverse[type],
        "uri": uri,
      };
}

enum AlbumTypeEnum { album, compilation }

final albumTypeEnumValues = EnumValues(
    {"album": AlbumTypeEnum.album, "compilation": AlbumTypeEnum.compilation});

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

enum ReleaseDatePrecision { day, month, year }

final releaseDatePrecisionValues = EnumValues({
  "day": ReleaseDatePrecision.day,
  "month": ReleaseDatePrecision.month,
  "year": ReleaseDatePrecision.year
});

class Artists {
  final String? href;
  final List<ArtistsItem>? items;
  final int? limit;
  final String? next;
  final int? offset;
  final dynamic previous;
  final int? total;

  Artists({
    this.href,
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  factory Artists.fromRawJson(String str) => Artists.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Artists.fromJson(Map<String, dynamic> json) => Artists(
        href: json["href"],
        items: json["items"] == null
            ? []
            : List<ArtistsItem>.from(
                json["items"]!.map((x) => ArtistsItem.fromJson(x))),
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
      };
}

class ArtistsItem {
  final ExternalUrls? externalUrls;
  final Followers? followers;
  final List<String>? genres;
  final String? href;
  final String? id;
  final List<Image>? images;
  final String? name;
  final int? popularity;
  final ArtistType? type;
  final String? uri;

  ArtistsItem({
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

  factory ArtistsItem.fromRawJson(String str) =>
      ArtistsItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ArtistsItem.fromJson(Map<String, dynamic> json) => ArtistsItem(
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
        type: artistTypeValues.map[json["type"]]!,
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
        "type": artistTypeValues.reverse[type],
        "uri": uri,
      };
}

class Followers {
  final dynamic href;
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

class Tracks {
  final String? href;
  final List<TracksItem>? items;
  final int? limit;
  final String? next;
  final int? offset;
  final dynamic previous;
  final int? total;

  Tracks({
    this.href,
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  factory Tracks.fromRawJson(String str) => Tracks.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
        href: json["href"],
        items: json["items"] == null
            ? []
            : List<TracksItem>.from(
                json["items"]!.map((x) => TracksItem.fromJson(x))),
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
      };
}

class TracksItem {
  final AlbumElement? album;
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
  final PurpleType? type;
  final String? uri;

  TracksItem({
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

  factory TracksItem.fromRawJson(String str) =>
      TracksItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TracksItem.fromJson(Map<String, dynamic> json) => TracksItem(
        album:
            json["album"] == null ? null : AlbumElement.fromJson(json["album"]),
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
        type: purpleTypeValues.map[json["type"]]!,
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
        "type": purpleTypeValues.reverse[type],
        "uri": uri,
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

enum PurpleType { track }

final purpleTypeValues = EnumValues({"track": PurpleType.track});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
