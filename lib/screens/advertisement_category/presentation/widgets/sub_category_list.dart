import 'package:flutter/material.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/screens/advertisement_category/domain/entities/entities.dart';
import 'package:landa/screens/advertisement_category/presentation/presentation.dart';

class SubCategoryList extends StatelessWidget {
  const SubCategoryList({
    required this.subCategories,
    this.onTap,
    super.key,
  });

  final List<SubCategory> subCategories;
  final void Function(SubCategory)? onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: subCategories.length,
      itemBuilder: (_, index) {
        return CategoryItem(
          title: subCategories[index].title,
          onTap: () {
            onTap?.call(subCategories[index]);
          },
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox.shrink().paddingXS();
      },
    );
  }
}
