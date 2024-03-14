part of 'advertisement_area_bloc.dart';

sealed class AdvertisementAreaEvent extends Equatable {
  const AdvertisementAreaEvent();

  @override
  List<Object> get props => [];
}

final class AdvertisementAreaInitialEvent extends AdvertisementAreaEvent {}
