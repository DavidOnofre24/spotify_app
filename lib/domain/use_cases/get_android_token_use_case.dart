import 'package:spotify_app/domain/repositories/login_repository.dart';

class GetAndroidTokenUseCase {
  final LoginRepository _loginRepository;

  GetAndroidTokenUseCase(
    this._loginRepository,
  );

  Future<String?> call() async {
    return await _loginRepository.getToken();
  }
}
