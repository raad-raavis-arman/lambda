import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class SubCategory extends Equatable {
  const SubCategory({
    required this.id,
    required this.categoryId,
    required this.nameFa,
    required this.nameEn,
    required this.iconName,
  });

  final int id;
  @JsonKey(name: 'category_id')
  final int categoryId;
  @JsonKey(name: 'name_fa')
  final String nameFa;
  @JsonKey(name: 'name_en')
  final String nameEn;
  @JsonKey(name: 'icon_name')
  final String iconName;

  @override
  List<Object?> get props => [
        id,
        categoryId,
        nameEn,
        nameFa,
        iconName,
      ];
}
