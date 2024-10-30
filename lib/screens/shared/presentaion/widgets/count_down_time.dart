import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/shared/presentaion/widgets/widgets.dart';

class CountDownTime extends StatefulWidget {
  const CountDownTime({
    required this.expireDateTime,
    required this.creationDateTime,
    super.key,
  });

  final DateTime expireDateTime;
  final DateTime creationDateTime;

  @override
  State<CountDownTime> createState() => _CountDownTimeState();
}

class _CountDownTimeState extends State<CountDownTime>
    with SingleTickerProviderStateMixin {
  late CountdownTimerController countdownTimerController;

  @override
  void initState() {
    countdownTimerController = CountdownTimerController(
      endTime: widget.expireDateTime.millisecondsSinceEpoch + 1000 * 30,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    countdownTimerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CountdownTimer(
      controller: countdownTimerController,
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
            CountDownTimeItem(
              label: context.l10n.hour,
              time: time?.hours,
              bgColor: bgColor,
            ).paddingXXS(),
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
