import 'package:flutter/material.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/screens/advertisement_category/domain/entities/entities.dart';
import 'package:landa/screens/advertisement_category/presentation/presentation.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    required this.categories,
    this.onTap,
    super.key,
  });

  final List<Category> categories;
  final void Function(Category)? onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: categories.length,
      itemBuilder: (_, index) {
        return CategoryItem(
          title: categories[index].nameFa,
          iconName: categories[index].iconName,
          onTap: () {
            onTap?.call(categories[index]);
          },
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox.shrink().paddingXS();
      },
    );
  }
}
