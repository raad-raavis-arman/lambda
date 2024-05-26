import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.mobileNumber,
  });

  final int id;
  @JsonKey(name: 'mobile_number')
  final String mobileNumber;

  @override
  List<Object?> get props => [
        id,
        mobileNumber,
      ];
}
