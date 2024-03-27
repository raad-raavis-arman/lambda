part of 'create_advertisement_bloc.dart';

final class CreateAdvertisementEvent extends Equatable {
  const CreateAdvertisementEvent({required this.param});

  final CreateAdvertisementParam param;

  @override
  List<Object> get props => [param];
}
