import 'package:flutter/material.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';

class CountDownTime extends StatelessWidget {
  const CountDownTime({
    required this.expireDateTime,
    required this.creationDateTime,
    super.key,
  });

  final DateTime expireDateTime;
  final DateTime creationDateTime;

  Duration get remainedDuration => expireDateTime.difference(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final totalDuration = expireDateTime.difference(creationDateTime);
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 30)),
      builder: (context, _) {
        return Stack(
          alignment: Alignment.center,
          children: [
            IntrinsicHeight(
              child: SizedBox(
                width: 80,
                height: 80,
                child: CircularProgressIndicator(
                  backgroundColor: Theme.of(context).highlightColor,
                  value: remainedDuration.inMinutes / totalDuration.inMinutes,
                ),
              ),
            ),
            MText(
              context,
              context.l10n.countdownTime(
                remainedDuration.days.toString(),
                remainedDuration.hours.toString(),
                remainedDuration.minutes.toString(),
              ),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        );
      },
    );
  }
}
