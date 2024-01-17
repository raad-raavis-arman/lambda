import 'package:json_annotation/json_annotation.dart';
import 'package:landa/screens/login/domain/entities/entities.dart';

part 'otp_model.g.dart';

@JsonSerializable()
class OtpModel extends Otp {
  const OtpModel({required super.otpCode});

  factory OtpModel.fromJson(Map<String, dynamic> json) =>
      _$OtpModelFromJson(json);

  Map<String, dynamic> toJson() => _$OtpModelToJson(this);
}
