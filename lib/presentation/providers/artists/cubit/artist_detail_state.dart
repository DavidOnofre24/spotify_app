part of 'artist_detail_cubit.dart';

abstract class ArtistDetailState extends Equatable {
  const ArtistDetailState();

  @override
  List<Object> get props => [];
}

class ArtistDetailInitial extends ArtistDetailState {}

class ArtistDetailSuccess extends ArtistDetailState {
  final ArtistEntity artist;

  const ArtistDetailSuccess(this.artist);

  @override
  List<Object> get props => [artist];
}

class ArtistDetailFailure extends ArtistDetailState {
  const ArtistDetailFailure();
}

class ArtistDetailLoading extends ArtistDetailState {
  const ArtistDetailLoading();
}
