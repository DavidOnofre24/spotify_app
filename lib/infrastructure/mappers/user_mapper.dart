import 'package:spotify_app/domain/entities/user.dart';
import 'package:spotify_app/infrastructure/models/user_response.dart';

class UserMapper {
  static User toEntity(UserResponse userResponse) {
    return User(
      id: userResponse.id,
      name: userResponse.displayName,
      email: userResponse.email,
      photoUrl:
          userResponse.images.isNotEmpty ? userResponse.images.first.url : '',
    );
  }
}
