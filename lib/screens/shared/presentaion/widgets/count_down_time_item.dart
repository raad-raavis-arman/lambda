import 'package:flutter/material.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/m_text.dart';

class CountDownTimeItem extends StatelessWidget {
  const CountDownTimeItem({
    required this.label,
    this.bgColor,
    this.time,
    super.key,
  });

  final int? time;
  final String label;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.rW(2)),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bgColor ?? Theme.of(context).highlightColor,
        borderRadius: BorderRadius.all(
          Radius.circular(context.radiusS),
        ),
      ),
      child: Column(
        children: [
          MText(
            text: '${time ?? 0}',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Container(
            width: 30,
            color: Theme.of(context).dividerColor,
            height: 0.4,
          ).paddingXXS(),
          MText(
            text: label,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
