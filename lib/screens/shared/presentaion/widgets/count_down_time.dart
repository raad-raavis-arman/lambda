import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/shared/presentaion/widgets/widgets.dart';

class CountDownTime extends StatelessWidget {
  const CountDownTime({
    required this.expireDateTime,
    required this.creationDateTime,
    super.key,
  });

  final DateTime expireDateTime;
  final DateTime creationDateTime;

  @override
  Widget build(BuildContext context) {
    return CountdownTimer(
      endTime: expireDateTime.millisecondsSinceEpoch + 1000 * 30,
      widgetBuilder: (context, time) {
        final bgColor = (time?.days ?? 0) < 1
            ? Theme.of(context).colorScheme.errorContainer
            : Theme.of(context).highlightColor;
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            CountDownTimeItem(
              label: context.l10n.minute,
              time: time?.min,
              bgColor: bgColor,
            ),
            const SizedBox.shrink().paddingXXS(),
            CountDownTimeItem(
              label: context.l10n.hour,
              time: time?.hours,
              bgColor: bgColor,
            ),
            const SizedBox.shrink().paddingXXS(),
            CountDownTimeItem(
              label: context.l10n.day,
              time: time?.days,
              bgColor: bgColor,
            ),
          ],
        );
      },
    );
  }
}
