part of 'create_advertisement_bloc.dart';

sealed class CreateAdvertisementState extends Equatable {
  const CreateAdvertisementState();

  @override
  List<Object> get props => [];
}

final class CreateAdvertisementInitialState extends CreateAdvertisementState {
  const CreateAdvertisementInitialState();
}

final class CreateAdvertisementLoadingState extends CreateAdvertisementState {
  const CreateAdvertisementLoadingState();
}

final class CreateAdvertisementErrorState extends CreateAdvertisementState {
  const CreateAdvertisementErrorState();
}

final class CreateAdvertisementSuccessState extends CreateAdvertisementState {
  const CreateAdvertisementSuccessState();
}
