import 'package:flutter/material.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';

class SuggestCategoryWidget extends StatelessWidget {
  const SuggestCategoryWidget({
    required this.onButtonPressed,
    super.key,
  });

  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MText(
          text: context.l10n.suggestCategoryWarning,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        SizedBox(
          height: context.marginS,
        ),
        TextButton(
          onPressed: onButtonPressed,
          style: ButtonStyle(
            padding: WidgetStatePropertyAll(
              EdgeInsets.all(context.marginXS),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.l10n.suggestNewCategory,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                width: context.marginM,
              ),
              Icon(
                Icons.add_outlined,
                size: context.iconS,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
