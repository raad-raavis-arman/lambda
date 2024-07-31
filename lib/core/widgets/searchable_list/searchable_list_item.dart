import 'package:flutter/material.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';

class SearchableListItem extends StatefulWidget {
  const SearchableListItem({
    required this.title,
    this.iconUrl,
    this.showTrailingArrow = true,
    this.isSelectable = false,
    this.isSelected = false,
    super.key,
    this.onSelect,
    this.onUnSelect,
    this.onTap,
  });

  final VoidCallback? onSelect;
  final VoidCallback? onUnSelect;
  final VoidCallback? onTap;
  final String? iconUrl;
  final String title;
  final bool showTrailingArrow;
  final bool isSelectable;
  final bool isSelected;

  @override
  State<SearchableListItem> createState() => _SearchableListItemState();
}

class _SearchableListItemState extends State<SearchableListItem> {
  late bool isSelected = widget.isSelected;

  @override
  void didUpdateWidget(covariant SearchableListItem oldWidget) {
    if (oldWidget.isSelected != widget.isSelected) {
      isSelected = widget.isSelected;
    }
    super.didUpdateWidget(oldWidget);
  }

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
        onTap: widget.isSelectable
            ? () {
                setState(() {
                  isSelected = !isSelected;
                });
                if (isSelected) {
                  widget.onSelect?.call();
                } else {
                  widget.onUnSelect?.call();
                }
              }
            : widget.onTap,
        child: Row(
          children: [
            if (widget.iconUrl != null)
              Image.network(
                widget.iconUrl!,
                width: context.iconM,
                height: context.iconM,
                errorBuilder: (_, __, ___) => const SizedBox.shrink(),
              ).paddingSymmetric(horizontal: context.marginXS),
            Expanded(
              child: MText(
                text: widget.title,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            if (widget.isSelectable)
              SizedBox(
                width: context.iconM,
                height: context.iconM,
                child: Checkbox.adaptive(
                  value: isSelected,
                  onChanged: (_) {},
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            if (widget.showTrailingArrow)
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
