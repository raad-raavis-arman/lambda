import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class Province extends Equatable {
  const Province({
    required this.id,
    required this.name,
  });

  @JsonKey(name: 'province_id')
  final int id;
  @JsonKey(name: 'province_name')
  final String name;

  @override
  List<Object?> get props => [id, name];
}
