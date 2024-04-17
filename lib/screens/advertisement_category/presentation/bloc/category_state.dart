part of 'category_bloc.dart';

final class CategoryState extends Equatable {
  const CategoryState({
    this.categories = const {},
    this.status = StateStatus.initial,
  });

  final Map<Category, List<SubCategory>> categories;
  final StateStatus status;

  CategoryState copyWith({
    StateStatus? status,
    Map<Category, List<SubCategory>>? categories,
  }) {
    return CategoryState(
      categories: categories ?? this.categories,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        categories,
        status,
      ];
}
