import 'package:landa/core/network/network.dart';
import 'package:landa/screens/advertisement_category/data/datasources/datasources.dart';
import 'package:landa/screens/advertisement_category/data/models/models.dart';

class CategoryRemoteDataSourceImpl implements CategoryDataSource {
  CategoryRemoteDataSourceImpl({
    required this.restClientService,
  });
  final RestClientService restClientService;

  @override
  Future<List<CategoryModel>> getAllCategory() {
    throw UnimplementedError();
  }

  @override
  Future<bool> suggestNewCategory({required String name}) {
    throw UnimplementedError();
  }
}
