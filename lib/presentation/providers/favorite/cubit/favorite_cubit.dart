import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spotify_app/domain/entities/favorite_track.dart';
import 'package:spotify_app/domain/use_cases/get_favorites_tracks_use_case.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final GetFavoritesTracksUseCase getFavoritesTracksUseCase;
  FavoriteCubit({required this.getFavoritesTracksUseCase})
      : super(FavoriteInitial());

  void getFavorites() async {
    emit(const FavoriteLoading());
    try {
      final listFavoriteTracks = await getFavoritesTracksUseCase();
      emit(FavoriteSuccess(listFavoriteTracks));
    } catch (e) {
      emit(const FavoriteFailure());
    }
  }
}
