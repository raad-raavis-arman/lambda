import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/core/error/failure.dart';
import 'package:landa/core/usecase/usecase.dart';
import 'package:landa/screens/login/domain/entities/entities.dart';

class UserOtp implements BaseUseCase<Otp, OtpParam> {
  @override
  Future<Either<Failure, Otp>> call(OtpParam params) {
    throw UnimplementedError();
  }
  
}

class OtpParam extends Equatable {
  final String mobileNumber;

  const OtpParam({required this.mobileNumber});

  @override
  List<Object?> get props => [mobileNumber];
}
