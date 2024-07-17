part of 'marked_advertisements_bloc.dart';

final class MarkedAdvertisementsState extends BaseState {
  const MarkedAdvertisementsState({
    super.status = StateStatus.initial,
    this.data = const [],
  });

  final List<Advertisement> data;

  MarkedAdvertisementsState copyWith({
    StateStatus? status,
    List<Advertisement>? data,
  }) =>
      MarkedAdvertisementsState(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  @override
  List<Object> get props => [
        ...super.props,
        data,
      ];
}
