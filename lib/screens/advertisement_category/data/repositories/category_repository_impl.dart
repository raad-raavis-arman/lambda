import 'package:dartz/dartz.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/screens/advertisement_category/data/datasources/datasources.dart';
import 'package:landa/screens/advertisement_category/domain/entities/entities.dart';
import 'package:landa/screens/advertisement_category/domain/repositories/repositories.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl({
    required this.subcategoryRemoteDataSourceImpl,
    required this.subcategoryLocalDataSourceImpl,
    required this.categoryRemoteDataSourceImpl,
    required this.categoryLocalDataSourceImpl,
  });

  final CategoryRemoteDataSourceImpl categoryRemoteDataSourceImpl;
  final CategoryLocalDataSourceImpl categoryLocalDataSourceImpl;
  final SubCategoryRemoteDataSourceImpl subcategoryRemoteDataSourceImpl;
  final SubCategoryLocalDataSourceImpl subcategoryLocalDataSourceImpl;

  @override
  Future<Either<Failure, Map<Category, List<SubCategory>>>>
      getAllCategories() async {
    try {
      final categories = await categoryRemoteDataSourceImpl.getAllCategory();
      final subCategories =
          await subcategoryRemoteDataSourceImpl.getAllSubCategory();
      final result = categories.asMap().map(
            (key, value) => MapEntry(
              value,
              subCategories
                  .where((element) => element.categoryId == value.id)
                  .toList(),
            ),
          );
      categoryLocalDataSourceImpl.setAllCategory(categories);
      subcategoryLocalDataSourceImpl.setAllSubCategory(subCategories);
      return Right(result);
    } on MException catch (_) {
      final categories = categoryLocalDataSourceImpl.getAllCategory();
      final subCategories = subcategoryLocalDataSourceImpl.getAllSubCategory();
      final result = categories.asMap().map(
            (key, value) => MapEntry(
              value,
              subCategories
                  .where((element) => element.categoryId == value.id)
                  .toList(),
            ),
          );
      return Right(result);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> suggestNewCategory({
    required String name,
  }) async {
    try {
      final result =
          await categoryRemoteDataSourceImpl.suggestNewCategory(name: name);
      return Right(result);
    } on MException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, bool>> suggestNewSubCategory({
    required String name,
    required int categoryId,
  }) async {
    try {
      final result =
          await subcategoryRemoteDataSourceImpl.suggestNewSubCategory(
        name: name,
        categoryId: categoryId,
      );
      return Right(result);
    } on MException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    }
  }
}
