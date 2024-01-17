import 'package:dartz/dartz.dart';
import 'package:landa/core/error/error.dart';

abstract interface class BaseUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
