part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class AllCategoryState extends CategoryState {
  const AllCategoryState({required this.categories});

  final Map<Category, List<SubCategory>> categories;

  @override
  List<Object> get props => [categories];
}
