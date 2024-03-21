part of 'track_detail_cubit.dart';

abstract class TrackDetailState extends Equatable {
  const TrackDetailState();

  @override
  List<Object> get props => [];
}

class TrackDetailInitial extends TrackDetailState {}

class TrackDetailSuccess extends TrackDetailState {
  final Track track;

  const TrackDetailSuccess(this.track);
}

class TrackDetailFailure extends TrackDetailState {
  const TrackDetailFailure();
}

class TrackDetailLoading extends TrackDetailState {
  const TrackDetailLoading();
}
