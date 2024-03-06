import 'package:dartz/dartz.dart';
import 'package:landa/core/error/failure.dart';
import 'package:landa/screens/advertisement_category/domain/entities/entities.dart';

abstract interface class SubCategoryRepository {
  Future<Either<Failure, List<SubCategory>>> getAllSubCategories();
  Future<Either<Failure, bool>> suggestNewSubCategory({
    required String name,
    required int categoryId,
  });
}
