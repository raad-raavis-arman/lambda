part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitialState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeErrorState extends HomeState {}

final class HomeAdvertisementsState extends HomeState {
  const HomeAdvertisementsState({required this.advertisements});

  final List<Advertisement> advertisements;

  @override
  List<Object> get props => [advertisements];
}
