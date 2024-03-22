import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spotify_app/domain/entities/track.dart';
import 'package:spotify_app/domain/use_cases/get_favorites_tracks_use_case.dart';
import 'package:spotify_app/domain/use_cases/get_recommendations_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetRecommendationsUseCase getRecommendationsUseCase;
  final GetFavoritesTracksUseCase getFavoritesTracksUseCase;

  HomeCubit({
    required this.getRecommendationsUseCase,
    required this.getFavoritesTracksUseCase,
  }) : super(HomeInitial());

  Future<void> getRecommendations() async {
    emit(const HomeLoading());
    try {
      final favorites = await getFavoritesTracksUseCase();
      final ids = favorites.take(4).map((e) => e.track.id!).toList();
      final recommendations = await getRecommendationsUseCase(ids);
      emit(HomeSuccess(recommendations));
    } catch (e) {
      emit(const HomeFailure());
    }
  }
}
