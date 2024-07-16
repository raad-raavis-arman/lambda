import 'dart:async';

import 'package:dio/dio.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/core/exceptions/exceptions.dart';
import 'package:landa/core/network/network.dart';
import 'package:landa/screens/advertisement_category/data/datasources/sub_category_item_data_source.dart';
import 'package:landa/screens/advertisement_category/data/models/models.dart';

class SubCategoryItemRemoteDataSourceImpl implements SubCategoryItemDataSource {
  SubCategoryItemRemoteDataSourceImpl({
    required this.restClientService,
  });
  final RestClientService restClientService;

  @override
  Future<List<SubCategoryItemModel>> getAllSubCategoryItem() async {
    try {
      final result = await restClientService.get(
        '/subCategoryItem',
      );
      if (result['success'] == true) {
        final jsonArray = result['data'] as List<dynamic>;
        return List<SubCategoryItemModel>.from(
          jsonArray.map(
            (e) => SubCategoryItemModel.fromJson(e as Map<String, dynamic>),
          ),
        );
      } else {
        throw MException(
          errorMessage: 'failed to get all sub-categorie-items',
          data: result,
        );
      }
    } on DioException catch (e) {
      throw MException.fromDioError(e);
    } on Exception catch (e, s) {
      unawaited(
        sentToSentry(exception: e, stackTrace: s),
      );
      rethrow;
    }
  }

  @override
  Future<bool> suggestNewSubCategoryItem({
    required String name,
    required int categoryId,
    required int subCategoryId,
  }) {
    throw UnimplementedError();
  }
}
