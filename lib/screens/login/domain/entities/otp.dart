import 'package:equatable/equatable.dart';

class Otp extends Equatable {
  final String otpCode;

  const Otp({required this.otpCode});

  @override
  List<Object?> get props => [otpCode];
}
