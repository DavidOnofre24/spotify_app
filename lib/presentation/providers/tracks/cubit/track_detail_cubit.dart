import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spotify_app/domain/entities/track.dart';
import 'package:spotify_app/domain/use_cases/get_track_by_id_use_case.dart';

part 'track_detail_state.dart';

class TrackDetailCubit extends Cubit<TrackDetailState> {
  final GetTrackByIdUseCase getTrackByIdUseCase;
  TrackDetailCubit({required this.getTrackByIdUseCase})
      : super(TrackDetailInitial());

  Future<void> getTrackById(String id) async {
    try {
      emit(const TrackDetailLoading());
      final track = await getTrackByIdUseCase.execute(id);
      emit(TrackDetailSuccess(track!));
    } catch (e) {
      emit(const TrackDetailFailure());
    }
  }
}
