import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class Category extends Equatable {
  const Category({
    required this.id,
    required this.nameFa,
    required this.nameEn,
    required this.iconName,
    required this.productType,
  });

  final int id;
  @JsonKey(name: 'name_fa')
  final String nameFa;
  @JsonKey(name: 'name_en')
  final String nameEn;
  @JsonKey(name: 'icon_name')
  final String iconName;
  @JsonKey(name: 'product_type')
  final int productType;

  @override
  List<Object?> get props => [
        id,
        nameFa,
        nameEn,
        iconName,
        productType,
      ];
}
