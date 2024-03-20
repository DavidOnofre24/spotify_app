import 'package:spotify_app/domain/repositories/storage_repository.dart';
import 'package:spotify_app/infrastructure/datasource/secure_storage_data_source.dart';

class StorageRepositoryImpl implements StorageRepository {
  final SecureStorageDataSource _storageDataSource;

  StorageRepositoryImpl(this._storageDataSource);

  @override
  Future<String?> getToken() async {
    return await _storageDataSource.getToken();
  }
}
