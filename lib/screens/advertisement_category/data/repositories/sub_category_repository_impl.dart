import 'package:dartz/dartz.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/screens/advertisement_category/data/datasources/datasources.dart';
import 'package:landa/screens/advertisement_category/domain/entities/entities.dart';
import 'package:landa/screens/advertisement_category/domain/repositories/repositories.dart';

class SubCategoryRepositoryImpl implements SubCategoryRepository {
  SubCategoryRepositoryImpl({
    required this.subcategoryRemoteDataSourceImpl,
    required this.subcategoryLocalDataSourceImpl,
  });

  final SubCategoryRemoteDataSourceImpl subcategoryRemoteDataSourceImpl;
  final SubCategoryLocalDataSourceImpl subcategoryLocalDataSourceImpl;

  @override
  Future<Either<Failure, List<SubCategory>>> getAllSubCategories() async {
    // TODO(Taleb): handle offline mode also
    try {
      final result = await subcategoryRemoteDataSourceImpl.getAllSubCategory();
      return Right(result);
    } on MDioException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, bool>> suggestNewSubCategory({
    required String name,
    required int categoryId,
  }) async {
    // TODO(Taleb): handle offline mode also
    try {
      final result =
          await subcategoryRemoteDataSourceImpl.suggestNewSubCategory(
        name: name,
        categoryId: categoryId,
      );
      return Right(result);
    } on MDioException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    }
  }
}
