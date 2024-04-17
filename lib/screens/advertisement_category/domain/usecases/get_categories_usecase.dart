import 'package:dartz/dartz.dart';
import 'package:landa/core/error/failure.dart';
import 'package:landa/core/usecase/usecase.dart';
import 'package:landa/screens/advertisement_category/domain/entities/entities.dart';
import 'package:landa/screens/advertisement_category/domain/repositories/repositories.dart';

class GetCategoriesUsescase
    extends BaseUseCase<Map<Category, List<SubCategory>>, NoParams> {
  GetCategoriesUsescase({required this.categoryRepository});

  final CategoryRepository categoryRepository;

  @override
  Future<Either<Failure, Map<Category, List<SubCategory>>>> call(
    NoParams params,
  ) {
    return categoryRepository.getAllCategories();
  }
}
