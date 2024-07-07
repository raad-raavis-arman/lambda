part of 'category_bloc.dart';

final class CategoryState extends Equatable {
  const CategoryState({
    this.categoryData = const CategoryData(
      categories: [],
      subCategories: [],
      subCategoryItems: [],
    ),
    this.status = StateStatus.initial,
    this.suggestCategorystatus = StateStatus.initial,
  });

  final CategoryData categoryData;
  final StateStatus status;
  final StateStatus suggestCategorystatus;

  CategoryState copyWith({
    StateStatus? status,
    StateStatus? suggestCategorystatus,
    CategoryData? categoryData,
  }) {
    return CategoryState(
      categoryData: categoryData ?? this.categoryData,
      status: status ?? this.status,
      suggestCategorystatus:
          suggestCategorystatus ?? this.suggestCategorystatus,
    );
  }

  @override
  List<Object> get props => [
        categoryData,
        status,
        suggestCategorystatus,
      ];
}
