import 'package:dartz/dartz.dart';
import 'package:landa/core/error/failure.dart';

abstract interface class ProfileRepository {
  Future<Either<Failure, bool>> signout();
}
