import 'package:dartz/dartz.dart';
import 'package:landa/core/error/failure.dart';
import 'package:landa/screens/advertisement_category/domain/entities/entities.dart';

abstract interface class CategoryRepository {
  Future<Either<Failure, CategoryData>> getAllCategoriesData();
  Future<List<Category>> getAllCategories();
  Future<List<SubCategory>> getAllSubCategories();
  Future<List<SubCategoryItem>> getAllSubCategoryItems();
  Future<Either<Failure, bool>> suggestNewCategory({required String name});
  Future<Either<Failure, bool>> suggestNewSubCategory({
    required String name,
    required int categoryId,
  });
}
