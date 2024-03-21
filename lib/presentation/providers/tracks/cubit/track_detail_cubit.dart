import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spotify_app/domain/entities/track.dart';
import 'package:spotify_app/domain/use_cases/add_favorite_use_case.dart';
import 'package:spotify_app/domain/use_cases/get_is_favorite_use_case.dart';
import 'package:spotify_app/domain/use_cases/get_track_by_id_use_case.dart';
import 'package:spotify_app/domain/use_cases/remove_favorite_use_case.dart';

part 'track_detail_state.dart';

class TrackDetailCubit extends Cubit<TrackDetailState> {
  final GetTrackByIdUseCase getTrackByIdUseCase;
  final AddFavoriteUseCase addFavoriteUseCase;
  final GetIsFavoriteUseCase getIsFavoriteUseCase;
  final RemoveFavoriteUseCase removeFavoriteUseCase;
  TrackDetailCubit({
    required this.getTrackByIdUseCase,
    required this.addFavoriteUseCase,
    required this.getIsFavoriteUseCase,
    required this.removeFavoriteUseCase,
  }) : super(TrackDetailInitial());

  void toggleFavorite(String id) async {
    final current = state;
    if (current is TrackDetailSuccess) {
      if (current.isFavorite) {
        await removeFavorite(id);
      } else {
        await addFavorite(id);
      }
      emit(TrackDetailSuccess(current.track, !current.isFavorite));
    }
  }

  Future<void> getTrackById(String id) async {
    try {
      emit(const TrackDetailLoading());
      final track = await getTrackByIdUseCase.execute(id);
      final isFavorite = await getIsFavoriteUseCase.execute(id);
      emit(TrackDetailSuccess(track!, isFavorite));
    } catch (e) {
      emit(const TrackDetailFailure());
    }
  }

  Future<void> addFavorite(String id) async {
    await addFavoriteUseCase.execute(id);
  }

  Future<void> removeFavorite(String id) async {
    await removeFavoriteUseCase.execute(id);
  }
}
