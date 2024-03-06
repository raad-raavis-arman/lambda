import 'package:json_annotation/json_annotation.dart';
import 'package:landa/screens/advertisement_category/domain/entities/entities.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends Category {
  const CategoryModel({
    required super.id,
    required super.title,
    required super.productType,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
