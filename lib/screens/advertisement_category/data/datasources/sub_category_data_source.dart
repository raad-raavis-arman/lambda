import 'package:landa/screens/advertisement_category/data/models/models.dart';

abstract interface class SubCategoryDataSource {
  Future<List<SubCategoryModel>> getAllSubCategory();
  Future<bool> suggestNewSubCategory({
    required String name,
    required int categoryId,
  });
}
