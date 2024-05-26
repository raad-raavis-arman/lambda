part of 'advertisement_area_bloc.dart';

sealed class AdvertisementAreaState extends Equatable {
  const AdvertisementAreaState();

  @override
  List<Object> get props => [];
}

final class AdvertisementAreaDataState extends AdvertisementAreaState {
  const AdvertisementAreaDataState({this.data = const {}});

  final Map<Province, List<City>> data;

  @override
  List<Object> get props => [data];
}

final class AdvertisementAreaLoadingState extends AdvertisementAreaState {}

final class AdvertisementAreaErrorState extends AdvertisementAreaState {}
