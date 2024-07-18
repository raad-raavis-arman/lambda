part of 'my_advertisements_bloc.dart';

final class MyAdvertisementsState extends BaseState {
  const MyAdvertisementsState({
    super.status = StateStatus.initial,
    this.data = const [],
  });

  final List<Advertisement> data;

  MyAdvertisementsState copyWith({
    StateStatus? status,
    List<Advertisement>? data,
  }) =>
      MyAdvertisementsState(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  @override
  List<Object> get props => [
        ...super.props,
        data,
      ];
}
