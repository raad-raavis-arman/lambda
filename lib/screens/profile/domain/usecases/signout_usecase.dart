import 'package:dartz/dartz.dart';
import 'package:landa/core/error/failure.dart';
import 'package:landa/core/usecase/usecase.dart';
import 'package:landa/screens/profile/domain/repositories/repositories.dart';

final class SignoutUsecase extends BaseUseCase<bool, NoParams> {
  SignoutUsecase({required this.profileRepository});

  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return profileRepository.signout();
  }
}
