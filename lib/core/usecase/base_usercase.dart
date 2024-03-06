import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/core/error/error.dart';

abstract interface class BaseUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);

  @override
  String toString() => '$runtimeType<$Type, $Params>';
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
