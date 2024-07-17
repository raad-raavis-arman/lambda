import 'package:json_annotation/json_annotation.dart';
import 'package:landa/screens/shared/domain/advertisements/entities/entities.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends Category {
  const CategoryModel({
    required super.id,
    required super.nameFa,
    required super.nameEn,
    required super.iconName,
    required super.productType,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
