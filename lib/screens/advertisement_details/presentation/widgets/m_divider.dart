import 'package:flutter/material.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';

class MDivider extends StatelessWidget {
  const MDivider({
    required this.text,
    super.key,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(child: Divider()),
        MText(
          text: text,
          style: Theme.of(context).textTheme.labelMedium,
          margin: EdgeInsets.only(
            left: context.margingS,
            right: context.margingS,
          ),
        ),
        const Flexible(child: Divider()),
      ],
    );
  }
}
