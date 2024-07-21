import 'package:dartz/dartz.dart';
import 'package:landa/core/error/error.dart';
import 'package:landa/screens/advertisement_category/data/datasources/datasources.dart';
import 'package:landa/screens/advertisement_category/domain/entities/entities.dart';
import 'package:landa/screens/advertisement_category/domain/repositories/repositories.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl({
    required this.subcategoryItemRemoteDataSourceImpl,
    required this.subcategoryItemLocalDataSourceImpl,
    required this.subcategoryRemoteDataSourceImpl,
    required this.subcategoryLocalDataSourceImpl,
    required this.categoryRemoteDataSourceImpl,
    required this.categoryLocalDataSourceImpl,
  });

  final CategoryRemoteDataSourceImpl categoryRemoteDataSourceImpl;
  final CategoryLocalDataSourceImpl categoryLocalDataSourceImpl;
  final SubCategoryRemoteDataSourceImpl subcategoryRemoteDataSourceImpl;
  final SubCategoryLocalDataSourceImpl subcategoryLocalDataSourceImpl;
  final SubCategoryItemRemoteDataSourceImpl subcategoryItemRemoteDataSourceImpl;
  final SubCategoryItemLocalDataSourceImpl subcategoryItemLocalDataSourceImpl;

  @override
  Future<Either<Failure, CategoryData>> getAllCategoriesData() async {
    try {
      final categories = await getAllCategories();
      final subCategories = await getAllSubCategories();
      final subCategoryItems = await getAllSubCategoryItems();
      return Right(
        CategoryData(
          categories: categories,
          subCategories: subCategories,
          subCategoryItems: subCategoryItems,
        ),
      );
    } on MException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<List<Category>> getAllCategories() async {
    try {
      final categories = await categoryRemoteDataSourceImpl.getAllCategory();
      categoryLocalDataSourceImpl.setAllCategory(categories);
      return categories;
    } on MException catch (_) {
      final categories = categoryLocalDataSourceImpl.getAllCategory();
      return categories;
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<SubCategory>> getAllSubCategories() async {
    try {
      final subCategories =
          await subcategoryRemoteDataSourceImpl.getAllSubCategory();
      subcategoryLocalDataSourceImpl.setAllSubCategory(subCategories);
      return subCategories;
    } on MException catch (_) {
      final subCategories = subcategoryLocalDataSourceImpl.getAllSubCategory();
      return subCategories;
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<SubCategoryItem>> getAllSubCategoryItems() async {
    try {
      final subCategoryItems =
          await subcategoryItemRemoteDataSourceImpl.getAllSubCategoryItem();
      subcategoryItemLocalDataSourceImpl
          .setAllSubCategoryItems(subCategoryItems);
      return subCategoryItems;
    } on MException catch (_) {
      final subCategoryItems =
          subcategoryItemLocalDataSourceImpl.getAllSubCategoryItems();
      return subCategoryItems;
    } on Exception catch (_) {
      rethrow;
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
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
