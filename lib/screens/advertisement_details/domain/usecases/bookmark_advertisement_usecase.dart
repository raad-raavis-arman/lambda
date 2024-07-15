import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/core/error/failure.dart';
import 'package:landa/core/usecase/usecase.dart';
import 'package:landa/screens/advertisement_details/domain/repositories/repositories.dart';

class BookmarkAdvertisementUsescase
    extends BaseUseCase<bool, BookmarkAdvertisementParam> {
  BookmarkAdvertisementUsescase({
    required this.advertisementDetailsRepository,
  });
  final AdvertisementDetailsRepository advertisementDetailsRepository;

  @override
  Future<Either<Failure, bool>> call(BookmarkAdvertisementParam params) =>
      advertisementDetailsRepository.bookmark(params.id);
}

class BookmarkAdvertisementParam extends Equatable {
  const BookmarkAdvertisementParam({
    required this.id,
  });
  final int id;

  @override
  List<Object?> get props => [id];
}
