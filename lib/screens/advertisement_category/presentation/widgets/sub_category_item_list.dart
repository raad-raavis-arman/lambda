import 'package:flutter/material.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/screens/advertisement_category/domain/entities/entities.dart';
import 'package:landa/screens/advertisement_category/presentation/presentation.dart';

class SubCategoryItemList extends StatelessWidget {
  const SubCategoryItemList({
    required this.subCategoryItems,
    this.onTap,
    super.key,
  });

  final List<SubCategoryItem> subCategoryItems;
  final void Function(SubCategoryItem)? onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: subCategoryItems.length,
      itemBuilder: (_, index) {
        return CategoryItem(
          title: subCategoryItems[index].nameFa,
          iconName: subCategoryItems[index].iconName,
          onTap: () {
            onTap?.call(subCategoryItems[index]);
          },
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox.shrink().paddingXS();
      },
    );
  }
}
