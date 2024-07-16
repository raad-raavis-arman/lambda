import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/core/error/failure.dart';
import 'package:landa/core/usecase/usecase.dart';
import 'package:landa/screens/advertisement_details/domain/repositories/repositories.dart';

class RemoveBookmarkAdvertisementUsescase
    extends BaseUseCase<bool, RemoveBookmarkAdvertisementParam> {
  RemoveBookmarkAdvertisementUsescase({
    required this.advertisementDetailsRepository,
  });
  final AdvertisementDetailsRepository advertisementDetailsRepository;

  @override
  Future<Either<Failure, bool>> call(RemoveBookmarkAdvertisementParam params) =>
      advertisementDetailsRepository.removeBookmark(params.id);
}

class RemoveBookmarkAdvertisementParam extends Equatable {
  const RemoveBookmarkAdvertisementParam({
    required this.id,
  });
  final int id;

  @override
  List<Object?> get props => [id];
}
