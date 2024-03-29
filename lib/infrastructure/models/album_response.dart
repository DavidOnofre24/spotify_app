import 'dart:convert';

class AlbumResponse {
  final String? albumType;
  final int? totalTracks;
  final List<String>? availableMarkets;
  final ExternalUrls? externalUrls;
  final String? href;
  final String? id;
  final List<Image>? images;
  final String? name;
  final String? releaseDate;
  final String? releaseDatePrecision;
  final Restrictions? restrictions;
  final String? type;
  final String? uri;
  final List<Artist>? artists;
  final Tracks? tracks;
  final List<Copyright>? copyrights;
  final ExternalIds? externalIds;
  final List<String>? genres;
  final String? label;
  final int? popularity;

  AlbumResponse({
    this.albumType,
    this.totalTracks,
    this.availableMarkets,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    this.releaseDate,
    this.releaseDatePrecision,
    this.restrictions,
    this.type,
    this.uri,
    this.artists,
    this.tracks,
    this.copyrights,
    this.externalIds,
    this.genres,
    this.label,
    this.popularity,
  });

  factory AlbumResponse.fromRawJson(String str) =>
      AlbumResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AlbumResponse.fromJson(Map<String, dynamic> json) => AlbumResponse(
        albumType: json["album_type"],
        totalTracks: json["total_tracks"],
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
        releaseDatePrecision: json["release_date_precision"],
        restrictions: json["restrictions"] == null
            ? null
            : Restrictions.fromJson(json["restrictions"]),
        type: json["type"],
        uri: json["uri"],
        artists: json["artists"] == null
            ? []
            : List<Artist>.from(
                json["artists"]!.map((x) => Artist.fromJson(x))),
        tracks: json["tracks"] == null ? null : Tracks.fromJson(json["tracks"]),
        copyrights: json["copyrights"] == null
            ? []
            : List<Copyright>.from(
                json["copyrights"]!.map((x) => Copyright.fromJson(x))),
        externalIds: json["external_ids"] == null
            ? null
            : ExternalIds.fromJson(json["external_ids"]),
        genres: json["genres"] == null
            ? []
            : List<String>.from(json["genres"]!.map((x) => x)),
        label: json["label"],
        popularity: json["popularity"],
      );

  Map<String, dynamic> toJson() => {
        "album_type": albumType,
        "total_tracks": totalTracks,
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
        "release_date_precision": releaseDatePrecision,
        "restrictions": restrictions?.toJson(),
        "type": type,
        "uri": uri,
        "artists": artists == null
            ? []
            : List<dynamic>.from(artists!.map((x) => x.toJson())),
        "tracks": tracks?.toJson(),
        "copyrights": copyrights == null
            ? []
            : List<dynamic>.from(copyrights!.map((x) => x.toJson())),
        "external_ids": externalIds?.toJson(),
        "genres":
            genres == null ? [] : List<dynamic>.from(genres!.map((x) => x)),
        "label": label,
        "popularity": popularity,
      };
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

class Copyright {
  final String? text;
  final String? type;

  Copyright({
    this.text,
    this.type,
  });

  factory Copyright.fromRawJson(String str) =>
      Copyright.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Copyright.fromJson(Map<String, dynamic> json) => Copyright(
        text: json["text"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "type": type,
      };
}

class ExternalIds {
  final String? isrc;
  final String? ean;
  final String? upc;

  ExternalIds({
    this.isrc,
    this.ean,
    this.upc,
  });

  factory ExternalIds.fromRawJson(String str) =>
      ExternalIds.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds(
        isrc: json["isrc"],
        ean: json["ean"],
        upc: json["upc"],
      );

  Map<String, dynamic> toJson() => {
        "isrc": isrc,
        "ean": ean,
        "upc": upc,
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

class Restrictions {
  final String? reason;

  Restrictions({
    this.reason,
  });

  factory Restrictions.fromRawJson(String str) =>
      Restrictions.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Restrictions.fromJson(Map<String, dynamic> json) => Restrictions(
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "reason": reason,
      };
}

class Tracks {
  final String? href;
  final int? limit;
  final String? next;
  final int? offset;
  final String? previous;
  final int? total;
  final List<Item>? items;

  Tracks({
    this.href,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
    this.items,
  });

  factory Tracks.fromRawJson(String str) => Tracks.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
        href: json["href"],
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  final List<Artist>? artists;
  final List<String>? availableMarkets;
  final int? discNumber;
  final int? durationMs;
  final bool? explicit;
  final ExternalUrls? externalUrls;
  final String? href;
  final String? id;
  final bool? isPlayable;
  final Artist? linkedFrom;
  final Restrictions? restrictions;
  final String? name;
  final String? previewUrl;
  final int? trackNumber;
  final String? type;
  final String? uri;
  final bool? isLocal;

  Item({
    this.artists,
    this.availableMarkets,
    this.discNumber,
    this.durationMs,
    this.explicit,
    this.externalUrls,
    this.href,
    this.id,
    this.isPlayable,
    this.linkedFrom,
    this.restrictions,
    this.name,
    this.previewUrl,
    this.trackNumber,
    this.type,
    this.uri,
    this.isLocal,
  });

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
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
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        isPlayable: json["is_playable"],
        linkedFrom: json["linked_from"] == null
            ? null
            : Artist.fromJson(json["linked_from"]),
        restrictions: json["restrictions"] == null
            ? null
            : Restrictions.fromJson(json["restrictions"]),
        name: json["name"],
        previewUrl: json["preview_url"],
        trackNumber: json["track_number"],
        type: json["type"],
        uri: json["uri"],
        isLocal: json["is_local"],
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
        "external_urls": externalUrls?.toJson(),
        "href": href,
        "id": id,
        "is_playable": isPlayable,
        "linked_from": linkedFrom?.toJson(),
        "restrictions": restrictions?.toJson(),
        "name": name,
        "preview_url": previewUrl,
        "track_number": trackNumber,
        "type": type,
        "uri": uri,
        "is_local": isLocal,
      };
}
