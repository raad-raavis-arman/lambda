import 'package:dio/dio.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/core/network/network.dart';
import 'package:landa/screens/advertisement_category/data/datasources/datasources.dart';
import 'package:landa/screens/advertisement_category/data/models/models.dart';

class SubCategoryRemoteDataSourceImpl implements SubCategoryDataSource {
  SubCategoryRemoteDataSourceImpl({
    required this.restClientService,
  });
  final RestClientService restClientService;

  @override
  Future<List<SubCategoryModel>> getAllSubCategory() async {
    try {
      final result = await restClientService.get(
        '/subCategory',
      );
      if (result['success'] == true) {
        final jsonArray = result['data'] as List<dynamic>;
        return List<SubCategoryModel>.from(
          jsonArray.map(
            (e) => SubCategoryModel.fromJson(e as Map<String, dynamic>),
          ),
        );
      } else {
        throw MException(
          errorMessage: 'failed to get all sub-categories',
          data: result,
        );
      }
    } on DioException catch (e) {
      throw MException.fromDioError(e);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> suggestNewSubCategory({
    required String name,
    required int categoryId,
  }) {
    throw UnimplementedError();
  }
}
