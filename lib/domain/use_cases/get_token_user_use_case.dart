import 'package:spotify_app/domain/repositories/storage_repository.dart';

class GetTokenUserUseCase {
  final StorageRepository _storageRepository;

  GetTokenUserUseCase(this._storageRepository);

  Future<String?> call() async {
    return await _storageRepository.getToken();
  }
}
