import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class Province extends Equatable {
  const Province({
    required this.provinceId,
    required this.provinceName,
  });

  @JsonKey(name: 'province_id')
  final String provinceId;
  @JsonKey(name: 'province_name')
  final String provinceName;

  @override
  List<Object?> get props => [provinceId, provinceName];
}
