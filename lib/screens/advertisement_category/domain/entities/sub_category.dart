import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class SubCategory extends Equatable {
  const SubCategory({
    required this.id,
    required this.categoryId,
    required this.title,
  });

  final int id;
  @JsonKey(name: 'category_id')
  final int categoryId;
  final String title;

  @override
  List<Object?> get props => [
        id,
        categoryId,
        title,
      ];
}
