import 'package:dartz/dartz.dart';
import 'package:landa/core/error/failure.dart';
import 'package:landa/core/usecase/usecase.dart';
import 'package:landa/screens/advertisement_category/domain/entities/entities.dart';
import 'package:landa/screens/advertisement_category/domain/repositories/repositories.dart';

class GetSubCategoriesUsescase
    extends BaseUseCase<List<SubCategory>, NoParams> {
  GetSubCategoriesUsescase({required this.subCategoryRepository});

  final SubCategoryRepository subCategoryRepository;

  @override
  Future<Either<Failure, List<SubCategory>>> call(NoParams params) {
    return subCategoryRepository.getAllSubCategories();
  }
}
