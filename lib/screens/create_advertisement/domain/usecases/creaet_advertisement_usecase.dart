import 'package:dartz/dartz.dart';
import 'package:landa/core/error/failure.dart';
import 'package:landa/core/usecase/usecase.dart';
import 'package:landa/screens/create_advertisement/domain/entities/entities.dart';
import 'package:landa/screens/create_advertisement/domain/repositories/repositories.dart';

class CreateAdvertisementUsescase
    extends BaseUseCase<bool, CreateAdvertisementParam> {
  CreateAdvertisementUsescase({required this.createAdvertisementRepository});
  final CreateAdvertisementRepository createAdvertisementRepository;

  @override
  Future<Either<Failure, bool>> call(CreateAdvertisementParam params) =>
      createAdvertisementRepository.create(params);
}

class CreateAdvertisementParam extends CreateAdvertisement {
  const CreateAdvertisementParam({
    required super.title,
    required super.description,
    required super.pExpireDateTime,
    required super.pCreateDateTime,
    required super.count,
    required super.originalPrice,
    required super.discountedPrice,
    required super.discount,
    required super.categoryId,
    required super.subCategoryId,
    required super.provinceId,
    required super.cityId,
    required super.contactNumber,
    required super.showContactInfo,
  });
}
