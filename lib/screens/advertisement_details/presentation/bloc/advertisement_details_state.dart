part of 'advertisement_details_bloc.dart';

final class AdvertisementDetailsState extends BaseState {
  const AdvertisementDetailsState({
    super.status = StateStatus.initial,
    this.bookmarkStatus = StateStatus.initial,
  });

  final StateStatus bookmarkStatus;

  @override
  List<Object?> get props => [
        ...super.props,
        bookmarkStatus,
      ];
}
