import 'package:dartz/dartz.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/screens/advertisement_category/data/datasources/datasources.dart';
import 'package:landa/screens/advertisement_category/domain/entities/entities.dart';
import 'package:landa/screens/advertisement_category/domain/repositories/repositories.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl({
    required this.categoryRemoteDataSourceImpl,
    required this.categoryLocalDataSourceImpl,
  });

  final CategoryRemoteDataSourceImpl categoryRemoteDataSourceImpl;
  final CategoryLocalDataSourceImpl categoryLocalDataSourceImpl;

  @override
  Future<Either<Failure, List<Category>>> getAllCategories() async {
    // TODO(Taleb): handle offline mode also
    try {
      final result = await categoryRemoteDataSourceImpl.getAllCategory();
      return Right(result);
    } on MDioException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, bool>> suggestNewCategory({
    required String name,
  }) async {
    // TODO(Taleb): handle offline mode also
    try {
      final result =
          await categoryRemoteDataSourceImpl.suggestNewCategory(name: name);
      return Right(result);
    } on MDioException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    }
  }
}
