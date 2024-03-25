import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/core/error/failure.dart';
import 'package:landa/core/usecase/usecase.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/screens/login/domain/entities/entities.dart';
import 'package:landa/screens/login/domain/repositories/repositories.dart';

class UserOtpUsescase extends BaseUseCase<Otp, OtpParam> {
  UserOtpUsescase({required this.userOtpRepository});
  final UserOtpRepository userOtpRepository;

  @override
  Future<Either<Failure, Otp>> call(OtpParam params) =>
      userOtpRepository.sendMobileOtp(params.mobileNumber.replaceFaNumToEn());
}

class OtpParam extends Equatable {
  const OtpParam({required this.mobileNumber});
  final String mobileNumber;

  @override
  List<Object?> get props => [mobileNumber];
}
