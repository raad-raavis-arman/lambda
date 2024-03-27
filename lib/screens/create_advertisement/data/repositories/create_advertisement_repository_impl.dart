import 'package:dartz/dartz.dart';
import 'package:landa/core/error/failure.dart';
import 'package:landa/core/error/m_exception.dart';
import 'package:landa/screens/create_advertisement/data/datasources/create_advertisement_remote_datasource.dart';
import 'package:landa/screens/create_advertisement/data/models/create_advertisement_model.dart';
import 'package:landa/screens/create_advertisement/domain/entities/create_advertisement.dart';
import 'package:landa/screens/create_advertisement/domain/repositories/repositories.dart';

class CreateAdvertisementRepositoryImpl
    implements CreateAdvertisementRepository {
  CreateAdvertisementRepositoryImpl({required this.remoteDatasource});

  final CreateAdvertisementRemoteDatasource remoteDatasource;
  @override
  Future<Either<Failure, bool>> create(
    CreateAdvertisement createAdvertisement,
  ) async {
    try {
      final result = await remoteDatasource.create(
        CreateAdvertisementModel(
          title: createAdvertisement.title,
          description: createAdvertisement.description,
          pExpireDateTime: createAdvertisement.pExpireDateTime,
          pCreateDateTime: createAdvertisement.pCreateDateTime,
          count: createAdvertisement.count,
          originalPrice: createAdvertisement.originalPrice,
          discountedPrice: createAdvertisement.discountedPrice,
          discount: createAdvertisement.discount,
          categoryId: createAdvertisement.categoryId,
          subCategoryId: createAdvertisement.subCategoryId,
          provinceId: createAdvertisement.provinceId,
          cityId: createAdvertisement.cityId,
          contactNumber: createAdvertisement.contactNumber,
          showContactInfo: createAdvertisement.showContactInfo,
        ),
      );
      return Right(result);
    } on MException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    }
  }
}
