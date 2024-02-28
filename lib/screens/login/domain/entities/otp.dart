import 'package:equatable/equatable.dart';

class Otp extends Equatable {

  const Otp({required this.otpCode});
  final String otpCode;

  @override
  List<Object?> get props => [otpCode];
}
