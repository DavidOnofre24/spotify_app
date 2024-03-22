import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spotify_app/domain/entities/album.dart';
import 'package:spotify_app/domain/use_cases/get_album_by_id_use_case.dart';

part 'album_detail_state.dart';

class AlbumDetailCubit extends Cubit<AlbumDetailState> {
  final GetAlbumByIdUseCase getAlbumByIdUseCase;
  AlbumDetailCubit({
    required this.getAlbumByIdUseCase,
  }) : super(AlbumDetailInitial());

  Future<void> getAlbumById(String id) async {
    emit(const AlbumDetailLoading());
    try {
      final album = await getAlbumByIdUseCase.execute(id);
      if (album == null) {
        emit(const AlbumDetailFailure());
      } else {
        emit(AlbumDetailSuccess(album));
      }
    } catch (e) {
      emit(const AlbumDetailFailure());
    }
  }
}
