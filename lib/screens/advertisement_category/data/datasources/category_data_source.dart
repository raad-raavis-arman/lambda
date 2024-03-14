import 'package:landa/screens/advertisement_category/data/models/models.dart';

abstract interface class CategoryDataSource {
  Future<List<CategoryModel>> getAllCategory();
  Future<bool> suggestNewCategory({required String name});
}
