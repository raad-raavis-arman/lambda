import 'package:flutter/material.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/searchable_list/searchable_list_entity.dart';
import 'package:landa/core/widgets/widgets.dart';

class SearchableListItem extends StatelessWidget {
  const SearchableListItem({
    required this.entity,
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;
  final SearchableListEntity entity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.marginXS),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).highlightColor),
        borderRadius: BorderRadius.all(
          Radius.circular(
            context.radiusS,
          ),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            if (entity.iconUrl != null)
              Image.network(
                entity.iconUrl!,
                width: context.iconM,
                height: context.iconM,
                errorBuilder: (_, __, ___) => const SizedBox.shrink(),
              ).paddingSymmetric(horizontal: context.marginXS),
            Expanded(
              child: MText(
                text: entity.title,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            if (entity.showTrailingArrow)
              Icon(
                Icons.arrow_right_rounded,
                size: context.iconS,
              ),
          ],
        ).paddingS(),
      ),
    );
  }
}
