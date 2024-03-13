import 'package:dartz/dartz.dart';
import 'package:landa/core/error/failure.dart';
import 'package:landa/core/usecase/usecase.dart';
import 'package:landa/screens/advertisement_category/domain/repositories/repositories.dart';

class SuggestCategoryUsescase extends BaseUseCase<bool, String> {
  SuggestCategoryUsescase({required this.categoryRepository});

  final CategoryRepository categoryRepository;

  @override
  Future<Either<Failure, bool>> call(String params) {
    return categoryRepository.suggestNewCategory(name: params);
  }
}
