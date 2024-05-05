import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class SubCategory extends Equatable {
  const SubCategory({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.parentId,
  });

  final int id;
  @JsonKey(name: 'category_id')
  final int categoryId;
  @JsonKey(name: 'parent_id')
  final int? parentId;
  final String title;

  @override
  List<Object?> get props => [
        id,
        categoryId,
        parentId,
        title,
      ];
}
