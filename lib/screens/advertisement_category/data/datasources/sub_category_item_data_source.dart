import 'package:landa/screens/advertisement_category/data/models/models.dart';

abstract interface class SubCategoryItemDataSource {
  Future<List<SubCategoryItemModel>> getAllSubCategoryItem();
  Future<bool> suggestNewSubCategoryItem({
    required String name,
    required int categoryId,
    required int subCategoryId,
  });
}
