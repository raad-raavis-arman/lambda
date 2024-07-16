part of 'advertisement_details_bloc.dart';

sealed class AdvertisementDetailsEvent extends Equatable {
  const AdvertisementDetailsEvent();

  @override
  List<Object> get props => [];
}

final class ToggleBookmarkAdvertisementEvent extends AdvertisementDetailsEvent {
  const ToggleBookmarkAdvertisementEvent({
    required this.advertisementId,
    required this.isMarked,
  });

  final int advertisementId;
  final bool isMarked;

  @override
  List<Object> get props => [
        advertisementId,
        isMarked,
      ];
}
