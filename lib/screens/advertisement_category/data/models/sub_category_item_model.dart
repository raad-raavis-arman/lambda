import 'package:json_annotation/json_annotation.dart';
import 'package:landa/screens/advertisement_category/domain/entities/entities.dart';

part 'sub_category_item_model.g.dart';

@JsonSerializable()
class SubCategoryItemModel extends SubCategoryItem {
  const SubCategoryItemModel({
    required super.id,
    required super.nameEn,
    required super.nameFa,
    required super.categoryId,
    required super.iconName,
    required super.active,
    required super.subCategoryId,
  });

  factory SubCategoryItemModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryItemModelToJson(this);
}
