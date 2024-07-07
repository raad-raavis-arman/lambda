import 'package:dio/dio.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/core/network/network.dart';
import 'package:landa/screens/advertisement_category/data/datasources/datasources.dart';
import 'package:landa/screens/advertisement_category/data/models/models.dart';

class CategoryRemoteDataSourceImpl implements CategoryDataSource {
  CategoryRemoteDataSourceImpl({
    required this.restClientService,
  });
  final RestClientService restClientService;

  @override
  Future<List<CategoryModel>> getAllCategory() async {
    try {
      final result = await restClientService.get(
        '/category',
      );
      if (result['success'] == true) {
        final jsonArray = result['data'] as List<dynamic>;
        return List<CategoryModel>.from(
          jsonArray.map(
            (e) => CategoryModel.fromJson(e as Map<String, dynamic>),
          ),
        );
      } else {
        throw MException(
          errorMessage: 'failed to get all categories',
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
  Future<bool> suggestNewCategory({required String name}) async {
    try {
      final result = await restClientService.post(
        '/suggestCategory',
        data: {
          'name': name,
        },
      );
      final isSuccess = result['success'];
      if (isSuccess) {
        return isSuccess;
      } else {
        throw MException(
          errorMessage: 'failed to get all categories',
          data: result,
        );
      }
    } on DioException catch (e) {
      throw MException.fromDioError(e);
    } on Exception catch (_) {
      rethrow;
    }
  }
}
