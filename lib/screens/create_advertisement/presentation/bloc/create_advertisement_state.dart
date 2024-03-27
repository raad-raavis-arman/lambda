part of 'create_advertisement_bloc.dart';

sealed class CreateAdvertisementState extends Equatable {
  const CreateAdvertisementState();

  @override
  List<Object> get props => [];
}

final class CreateAdvertisementInitialState extends CreateAdvertisementState {}

final class CreateAdvertisementLoadingState extends CreateAdvertisementState {}

final class CreateAdvertisementErrorState extends CreateAdvertisementState {}

final class CreateAdvertisementSuccessState extends CreateAdvertisementState {}
