import 'package:flutter/material.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    required this.title,
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(context.marginXS),
        margin: EdgeInsets.symmetric(horizontal: context.marginXS),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).highlightColor),
          borderRadius: BorderRadius.all(
            Radius.circular(
              context.radiusS,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.category,
              size: context.iconM,
            ),
            const SizedBox.shrink().paddingXS(),
            Expanded(
              child: MText(
                text: title,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Icon(
              Icons.arrow_right_rounded,
              size: context.iconS,
            ),
          ],
        ),
      ),
    );
  }
}
