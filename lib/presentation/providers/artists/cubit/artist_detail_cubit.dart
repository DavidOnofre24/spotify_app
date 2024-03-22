import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spotify_app/domain/entities/artist.dart';
import 'package:spotify_app/domain/use_cases/get_artist_by_id_use_case.dart';

part 'artist_detail_state.dart';

class ArtistDetailCubit extends Cubit<ArtistDetailState> {
  final GetArtistByIdUseCase getArtistByIdUseCase;
  ArtistDetailCubit({
    required this.getArtistByIdUseCase,
  }) : super(ArtistDetailInitial());

  Future<void> getArtistById(String id) async {
    emit(const ArtistDetailLoading());
    try {
      final artist = await getArtistByIdUseCase.execute(id);
      if (artist == null) {
        emit(const ArtistDetailFailure());
      } else {
        emit(ArtistDetailSuccess(artist));
      }
    } catch (e) {
      emit(const ArtistDetailFailure());
    }
  }
}
