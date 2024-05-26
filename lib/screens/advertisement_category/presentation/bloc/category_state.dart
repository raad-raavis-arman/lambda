part of 'category_bloc.dart';

final class CategoryState extends Equatable {
  const CategoryState({
    this.categoryData = const CategoryData(
      categories: [],
      subCategories: [],
      subCategoryItems: [],
    ),
    this.status = StateStatus.initial,
  });

  final CategoryData categoryData;
  final StateStatus status;

  CategoryState copyWith({
    StateStatus? status,
    CategoryData? categoryData,
  }) {
    return CategoryState(
      categoryData: categoryData ?? this.categoryData,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        categoryData,
        status,
      ];
}
