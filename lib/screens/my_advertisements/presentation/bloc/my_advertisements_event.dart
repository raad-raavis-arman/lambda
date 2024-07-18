part of 'my_advertisements_bloc.dart';

sealed class MyAdvertisementsEvent extends Equatable {
  const MyAdvertisementsEvent();

  @override
  List<Object> get props => [];
}

final class GetMyAdvertisementsEvent extends MyAdvertisementsEvent {}
