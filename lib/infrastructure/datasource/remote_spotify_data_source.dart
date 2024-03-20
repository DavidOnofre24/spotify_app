import 'dart:convert';
import 'package:spotify_app/domain/entities/user.dart';
import 'package:spotify_app/infrastructure/datasource/spotify_data_source.dart';
import 'package:dio/dio.dart';
import 'package:spotify_app/infrastructure/mappers/user_mapper.dart';
import 'package:spotify_app/infrastructure/models/token_response.dart';
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
  Future<String> getAuthorizationUrl() async {
    const scope = 'user-read-private user-read-email';

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
}