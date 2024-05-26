import 'package:equatable/equatable.dart';
import 'package:landa/screens/advertisement_category/domain/entities/entities.dart';

class CategoryData extends Equatable {
  const CategoryData({
    required this.categories,
    required this.subCategories,
    required this.subCategoryItems,
  });

  final List<Category> categories;
  final List<SubCategory> subCategories;
  final List<SubCategoryItem> subCategoryItems;

  @override
  List<Object?> get props => [
        categories,
        subCategories,
        subCategoryItems,
      ];
}
