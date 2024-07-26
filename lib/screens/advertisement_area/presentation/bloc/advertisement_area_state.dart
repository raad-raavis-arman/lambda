part of 'advertisement_area_bloc.dart';

final class AdvertisementAreaState extends BaseState {
  const AdvertisementAreaState({
    super.status = StateStatus.initial,
    this.data = const {},
  });

  final Map<Province, List<City>> data;

  AdvertisementAreaState copyWith({
    StateStatus? status,
    Map<Province, List<City>>? data,
  }) =>
      AdvertisementAreaState(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  @override
  List<Object> get props => [
        ...super.props,
        data,
      ];
}
