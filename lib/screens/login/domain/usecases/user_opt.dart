import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/core/error/failure.dart';
import 'package:landa/core/usecase/usecase.dart';

class UserOtp implements BaseUseCase<dynamic, OtpParam> {
  @override
  Future<Either<Failure, dynamic>> call(OtpParam params) {
    throw UnimplementedError();
  }
  
}

class OtpParam extends Equatable {
  final String mobileNumber;

  const OtpParam({required this.mobileNumber});

  @override
  List<Object?> get props => [mobileNumber];
}
