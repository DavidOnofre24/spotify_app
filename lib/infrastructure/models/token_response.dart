class TokenResponse {
  final String accessToken;
  final String tokenType;
  final String? scope;
  final int expiresIn;
  final String? refreshToken;

  TokenResponse({
    required this.accessToken,
    required this.tokenType,
    required this.scope,
    required this.expiresIn,
    required this.refreshToken,
  });

  factory TokenResponse.fromJson(Map<String, dynamic> json) {
    return TokenResponse(
      accessToken: json['access_token'],
      tokenType: json['token_type'],
      scope: json['scope'],
      expiresIn: json['expires_in'],
      refreshToken: json['refresh_token'],
    );
  }
}
