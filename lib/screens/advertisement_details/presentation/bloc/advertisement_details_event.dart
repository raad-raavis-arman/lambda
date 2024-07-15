part of 'advertisement_details_bloc.dart';

sealed class AdvertisementDetailsEvent extends Equatable {
  const AdvertisementDetailsEvent();

  @override
  List<Object> get props => [];
}

final class BookmarkAdvertisementEvent extends AdvertisementDetailsEvent {
  const BookmarkAdvertisementEvent({required this.advertisementId});

  final int advertisementId;

  @override
  List<Object> get props => [advertisementId];
}
