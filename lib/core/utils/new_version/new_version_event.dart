part of 'new_version_bloc.dart';

sealed class NewVersionEvent extends Equatable {
  const NewVersionEvent();

  @override
  List<Object> get props => [];
}

final class CheckNewVersionEvent extends NewVersionEvent {}
