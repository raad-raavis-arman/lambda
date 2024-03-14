import 'package:landa/core/network/network.dart';
import 'package:landa/screens/advertisement_category/data/datasources/datasources.dart';
import 'package:landa/screens/advertisement_category/data/models/models.dart';

class SubCategoryRemoteDataSourceImpl implements SubCategoryDataSource {
  SubCategoryRemoteDataSourceImpl({
    required this.restClientService,
  });
  final RestClientService restClientService;

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
