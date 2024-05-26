import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class SubCategoryItem extends Equatable {
  const SubCategoryItem({
    required this.id,
    required this.categoryId,
    required this.subCategoryId,
    required this.active,
    required this.nameFa,
    required this.nameEn,
    required this.iconName,
  });

  final int id;
  @JsonKey(name: 'category_id')
  final int categoryId;
  @JsonKey(name: 'sub_category_id')
  final int subCategoryId;
  @JsonKey(name: 'name_fa')
  final String nameFa;
  @JsonKey(name: 'name_en')
  final String nameEn;
  @JsonKey(name: 'icon_name')
  final String iconName;
  final bool active;

  @override
  List<Object?> get props => [
        id,
        categoryId,
        subCategoryId,
        nameEn,
        nameFa,
        iconName,
        active,
      ];
}
