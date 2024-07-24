import 'package:flutter/material.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/searchable_list/searchable_list_entity.dart';
import 'package:landa/core/widgets/widgets.dart';

class SelectedItemChip extends StatelessWidget {
  const SelectedItemChip({
    required this.entity,
    this.onDeleted,
    super.key,
  });

  final SearchableListEntity entity;
  final VoidCallback? onDeleted;

  @override
  Widget build(BuildContext context) {
    return Chip(
      color: WidgetStatePropertyAll(
        Theme.of(context).colorScheme.primary,
      ),
      elevation: 0,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      deleteIcon: Icon(
        Icons.close,
        color: Colors.white,
        size: context.iconS,
      ),
      onDeleted: onDeleted,
      label: MText(
        text: entity.title,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Colors.white,
            ),
      ),
    ).paddingXXS();
  }
}
