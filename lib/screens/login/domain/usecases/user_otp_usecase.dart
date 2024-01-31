import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/core/error/failure.dart';
import 'package:landa/core/usecase/usecase.dart';
import 'package:landa/screens/login/domain/entities/entities.dart';
import 'package:landa/screens/login/domain/repositories/repositories.dart';

class UserOtpUsescase implements BaseUseCase<Otp, OtpParam> {
  final UserOtpRepository userOtpRepository;

  UserOtpUsescase({required this.userOtpRepository});

  @override
  Future<Either<Failure, Otp>> call(OtpParam params) =>
      userOtpRepository.sendMobileOtp(params.mobileNumber);
}

class OtpParam extends Equatable {
  final String mobileNumber;

  const OtpParam({required this.mobileNumber});

  @override
  List<Object?> get props => [mobileNumber];
}
