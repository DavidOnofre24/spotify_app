part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  final List<FavoriteTrack> listFavoriteTracks;

  const FavoriteSuccess(this.listFavoriteTracks);
}

class FavoriteFailure extends FavoriteState {
  const FavoriteFailure();
}

class FavoriteLoading extends FavoriteState {
  const FavoriteLoading();
}
