part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class HomeGetAllAdEvent extends HomeEvent {
  const HomeGetAllAdEvent({
    required this.offset,
    required this.limit,
  });

  final int offset;
  final int limit;

  @override
  List<Object> get props => [offset, limit];
}
