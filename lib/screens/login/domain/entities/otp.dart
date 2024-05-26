import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class Otp extends Equatable {
  const Otp({required this.otpCode});

  @JsonKey(name: 'sms_code')
  final String otpCode;

  @override
  List<Object?> get props => [otpCode];
}
