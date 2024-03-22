part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeSuccess extends HomeState {
  final List<Track> recommendationsTracks;

  const HomeSuccess(this.recommendationsTracks);
}

class HomeFailure extends HomeState {
  const HomeFailure();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}
