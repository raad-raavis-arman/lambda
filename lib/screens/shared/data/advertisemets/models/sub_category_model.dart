import 'package:json_annotation/json_annotation.dart';
import 'package:landa/screens/shared/domain/advertisements/entities/entities.dart';

part 'sub_category_model.g.dart';

@JsonSerializable()
class SubCategoryModel extends SubCategory {
  const SubCategoryModel({
    required super.id,
    required super.nameEn,
    required super.nameFa,
    required super.categoryId,
    required super.iconName,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryModelToJson(this);
}
