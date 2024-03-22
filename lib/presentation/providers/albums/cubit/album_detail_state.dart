part of 'album_detail_cubit.dart';

abstract class AlbumDetailState extends Equatable {
  const AlbumDetailState();

  @override
  List<Object> get props => [];
}

class AlbumDetailInitial extends AlbumDetailState {}

class AlbumDetailSuccess extends AlbumDetailState {
  final AlbumEntity album;

  const AlbumDetailSuccess(this.album);

  @override
  List<Object> get props => [album];
}

class AlbumDetailFailure extends AlbumDetailState {
  const AlbumDetailFailure();
}

class AlbumDetailLoading extends AlbumDetailState {
  const AlbumDetailLoading();
}
