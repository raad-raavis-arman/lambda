part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class HomeGetAllAdEvent extends HomeEvent {
  const HomeGetAllAdEvent({
    this.offset = 0,
    this.limit = 10,
    this.query = '',
    this.cityIds = const [],
  });

  final int offset;
  final int limit;
  final String query;
  final List<int> cityIds;

  @override
  List<Object> get props => [
        offset,
        limit,
        query,
        cityIds,
      ];
}

final class HomeGetAllCategoriesEvent extends HomeEvent {}
