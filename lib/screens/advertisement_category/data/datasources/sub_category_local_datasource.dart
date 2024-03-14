import 'package:landa/screens/advertisement_category/data/datasources/datasources.dart';
import 'package:landa/screens/advertisement_category/data/models/models.dart';

class SubCategoryLocalDataSourceImpl implements SubCategoryDataSource {
  const SubCategoryLocalDataSourceImpl();

  @override
  Future<List<SubCategoryModel>> getAllSubCategory() {
    throw UnimplementedError();
  }

  @override
  Future<bool> suggestNewSubCategory({
    required String name,
    required int categoryId,
  }) {
    throw UnimplementedError();
  }
}
