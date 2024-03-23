import 'package:spotify_app/domain/repositories/login_repository.dart';
import 'package:spotify_app/infrastructure/datasource/login_data_source.dart';
import 'package:spotify_app/infrastructure/datasource/secure_storage_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource loginDataSource;
  final SecureStorageDataSource storageDataSource;

  LoginRepositoryImpl(this.loginDataSource, this.storageDataSource);

  @override
  Future<String?> getToken() async {
    final token = await loginDataSource.getToken();
    storageDataSource.saveToken(token ?? '');

    return token;
  }
}
