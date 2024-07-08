part of 'home_bloc.dart';

final class HomeState extends BaseState {
  const HomeState({
    super.status = StateStatus.initial,
    this.advertisements = const [],
    this.categoryData = const CategoryData(
      categories: [],
      subCategories: [],
      subCategoryItems: [],
    ),
  });

  final List<Advertisement> advertisements;
  final CategoryData categoryData;

  HomeState copyWith({
    StateStatus? status,
    List<Advertisement>? advertisements,
    CategoryData? categoryData,
  }) {
    return HomeState(
      status: status ?? this.status,
      advertisements: advertisements ?? this.advertisements,
      categoryData: categoryData ?? this.categoryData,
    );
  }

  @override
  List<Object?> get props => [
        ...super.props,
        advertisements,
        categoryData,
      ];
}
