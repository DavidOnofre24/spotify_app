import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spotify_app/domain/entities/favorite_track.dart';
import 'package:spotify_app/domain/use_cases/get_favorites_tracks_use_case.dart';
import 'package:spotify_app/domain/use_cases/remove_favorite_use_case.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final GetFavoritesTracksUseCase getFavoritesTracksUseCase;
  final RemoveFavoriteUseCase removeFavoriteUseCase;

  FavoriteCubit({
    required this.getFavoritesTracksUseCase,
    required this.removeFavoriteUseCase,
  }) : super(FavoriteInitial());

  void getFavorites() async {
    emit(const FavoriteLoading());
    try {
      final listFavoriteTracks = await getFavoritesTracksUseCase();
      emit(FavoriteSuccess(listFavoriteTracks));
    } catch (e) {
      emit(const FavoriteFailure());
    }
  }

  void removeFavorite(String id) async {
    final currentState = state;
    if (currentState is FavoriteSuccess) {
      emit(const FavoriteLoading());
      if (await removeFavoriteUseCase.execute(id)) {
        final listFavoriteTracks = currentState.listFavoriteTracks;
        final newListFavoriteTracks = listFavoriteTracks
            .where((element) => element.track.id != id)
            .toList();
        emit(FavoriteSuccess(newListFavoriteTracks));
      }
    } else {
      emit(const FavoriteFailure());
    }
  }
}
