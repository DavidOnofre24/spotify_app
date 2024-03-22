import 'dart:convert';
import 'package:spotify_app/domain/entities/artist.dart';
import 'package:spotify_app/domain/entities/album.dart';
import 'package:spotify_app/domain/entities/search_item.dart';
import 'package:spotify_app/domain/entities/track.dart';
import 'package:spotify_app/domain/entities/user.dart';
import 'package:spotify_app/infrastructure/datasource/spotify_data_source.dart';
import 'package:dio/dio.dart';
import 'package:spotify_app/infrastructure/mappers/album_mapper.dart';
import 'package:spotify_app/infrastructure/mappers/search_reponse_mapper.dart';
import 'package:spotify_app/infrastructure/mappers/track_mapper.dart';
import 'package:spotify_app/infrastructure/mappers/user_mapper.dart';
import 'package:spotify_app/infrastructure/models/album_response.dart';
import 'package:spotify_app/infrastructure/models/search_reponse.dart';
import 'package:spotify_app/infrastructure/models/token_response.dart';
import 'package:spotify_app/infrastructure/models/track_response.dart';
import 'package:spotify_app/infrastructure/models/user_response.dart';

class RemoteSpotifyDataSource implements SpotifyDataSource {
  final String clientId;
  final String redirectUri;
  final String clientSecret;
  final Dio dio;

  RemoteSpotifyDataSource({
    required this.clientId,
    required this.redirectUri,
    required this.dio,
    required this.clientSecret,
  });

  @override
  Future<String?> getToken(String code) async {
    final response = await dio.post(
      'https://accounts.spotify.com/api/token',
      data: {
        'code': code,
        'redirect_uri': redirectUri,
        'grant_type': 'authorization_code'
      },
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: {
          'Authorization':
              'Basic ${base64Encode(utf8.encode('$clientId:$clientSecret'))}'
        },
      ),
    );

    if (response.statusCode == 200) {
      final tokenResponse = TokenResponse.fromJson(response.data);
      return tokenResponse.accessToken;
    } else {
      return null;
    }
  }

  @override
  String getAuthorizationUrl() {
    const scope =
        'user-read-private user-read-email user-library-read user-top-read user-read-recently-played user-read-playback-state user-modify-playback-state user-read-currently-playing user-library-modify';

    final String authorizationUrl =
        'https://accounts.spotify.com/authorize?response_type=code&client_id=$clientId&scope=$scope&redirect_uri=$redirectUri';

    return authorizationUrl;
  }

  @override
  Future<User> getUser(String token) async {
    final response = await dio.get('https://api.spotify.com/v1/me',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ));

    if (response.statusCode == 200) {
      final userResponse = UserResponse.fromJson(response.data);
      final user = UserMapper.toEntity(userResponse);
      return user;
    } else {
      throw Exception('Failed to load user');
    }
  }

  @override
  Future<List<SearchResultItem>> search(
      String tokenAccess, String query) async {
    if (query.isEmpty) {
      return [];
    }
    final response = await dio.get(
      'https://api.spotify.com/v1/search?q=$query&type=album,artist,track',
      options: Options(
        headers: {
          'Authorization': 'Bearer $tokenAccess',
        },
      ),
    );

    if (response.statusCode == 200) {
      final data = SearchResponse.fromJson(response.data);
      final listSearch = SearchReponseMapper.combineItemstoEntity(data);
      return listSearch;
    } else {
      throw Exception('Failed to load search results');
    }
  }

  @override
  Future<Track?> getTrackById(String tokenAccess, String id) async {
    final response = await dio.get(
      'https://api.spotify.com/v1/tracks/$id',
      options: Options(
        headers: {'Authorization': 'Bearer $tokenAccess'},
      ),
    );
    if (response.statusCode == 200) {
      final trackResponse = TrackResponse.fromJson(response.data);
      return TrackMapper.trackResponseToEntity(trackResponse);
    } else {
      throw Exception('Failed to load track');
    }
  }

  @override
  Future<List<Track>> getRecommendations(
      String tokenAccess, List<String> ids) async {
    final idsString = ids.join(',');
    final response = await dio.get(
      'https://api.spotify.com/v1/recommendations?seed_tracks=$idsString',
      options: Options(
        headers: {'Authorization': 'Bearer $tokenAccess'},
      ),
    );

    if (response.statusCode == 200) {
      final data = response.data;

      final tracks = (data['tracks'] as List)
          .map((e) =>
              TrackMapper.trackResponseToEntity(TrackResponse.fromJson(e)))
          .toList();

      return tracks;
    } else {
      throw Exception('Failed to load recommendations');
    }
  }

  @override
  Future<AlbumEntity?> getAlbumById(String tokenAccess, String id) async {
    final response = await dio.get('https://api.spotify.com/v1/albums/$id',
        options: Options(
          headers: {'Authorization': 'Bearer $tokenAccess'},
        ));

    if (response.statusCode == 200) {
      final albumResponse = AlbumResponse.fromJson(response.data);
      final album = AlbumMapper.albumResponseToEntity(albumResponse);
      return album;
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Future<ArtistEntity?> getArtistById(String tokenAccess, String id) {
    // TODO: implement getArtistById
    throw UnimplementedError();
  }
}
