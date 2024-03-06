import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/core/error/failure.dart';
import 'package:landa/core/usecase/usecase.dart';
import 'package:landa/screens/advertisement_category/domain/repositories/repositories.dart';

class SuggestSubCategoryUsescase
    implements BaseUseCase<bool, SuggestSubCategoryParams> {
  SuggestSubCategoryUsescase({required this.subCategoryRepository});

  final SubCategoryRepository subCategoryRepository;

  @override
  Future<Either<Failure, bool>> call(SuggestSubCategoryParams params) {
    return subCategoryRepository.suggestNewSubCategory(
      name: params.name,
      categoryId: params.categoryId,
    );
  }
}

class SuggestSubCategoryParams extends Equatable {
  const SuggestSubCategoryParams({
    required this.name,
    required this.categoryId,
  });

  final String name;
  final int categoryId;

  @override
  List<Object?> get props => [
        name,
        categoryId,
      ];
}
