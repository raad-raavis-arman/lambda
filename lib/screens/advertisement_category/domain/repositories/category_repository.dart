import 'package:dartz/dartz.dart';
import 'package:landa/core/error/failure.dart';
import 'package:landa/screens/advertisement_category/domain/entities/entities.dart';

abstract interface class CategoryRepository {
  Future<Either<Failure, List<Category>>> getAllCategories();
  Future<Either<Failure, bool>> suggestNewCategory({required String name});
}
