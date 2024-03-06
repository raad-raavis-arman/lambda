import 'package:landa/screens/advertisement_category/data/datasources/datasources.dart';
import 'package:landa/screens/advertisement_category/data/models/models.dart';

class CategoryLocalDataSourceImpl implements CategoryDataSource {
  const CategoryLocalDataSourceImpl();

  @override
  Future<List<CategoryModel>> getAllCategory() {
    throw UnimplementedError();
  }

  @override
  Future<bool> suggestNewCategory({required String name}) {
    throw UnimplementedError();
  }
}
