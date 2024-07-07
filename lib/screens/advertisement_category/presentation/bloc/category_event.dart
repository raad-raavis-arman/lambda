part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

final class GetCategoriesEvent extends CategoryEvent {}

final class SuggestCategoryEvent extends CategoryEvent {
  const SuggestCategoryEvent({required this.name});

  final String name;

  @override
  List<Object> get props => [name];
}
