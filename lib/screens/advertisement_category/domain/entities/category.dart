import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class Category extends Equatable {
  const Category({
    required this.id,
    required this.title,
    required this.productType,
  });

  final int id;
  final String title;
  @JsonKey(name: 'product_type')
  final int productType;

  @override
  List<Object?> get props => [
        id,
        title,
        productType,
      ];
}
