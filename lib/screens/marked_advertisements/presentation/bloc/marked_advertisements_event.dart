part of 'marked_advertisements_bloc.dart';

sealed class MarkedAdvertisementsEvent extends Equatable {
  const MarkedAdvertisementsEvent();

  @override
  List<Object> get props => [];
}

final class GetAllMarkedAdvertisementsEvent extends MarkedAdvertisementsEvent {}
