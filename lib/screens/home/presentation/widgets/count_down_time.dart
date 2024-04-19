import 'package:flutter/material.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';

class CountDownTime extends StatelessWidget {
  const CountDownTime({
    required this.expireDateTime,
    required this.creationDateTime,
    this.size = 80,
    super.key,
  });

  final DateTime expireDateTime;
  final DateTime creationDateTime;
  final double size;

  Duration get remainedDuration => expireDateTime.difference(
        DateTime.now().toUtc(),
      );

  @override
  Widget build(BuildContext context) {
    final totalDuration = expireDateTime.difference(creationDateTime);
    return StreamBuilder(
      stream: remainedDuration.isNegative
          ? null
          : Stream.periodic(const Duration(seconds: 30)),
      builder: (context, _) {
        return Stack(
          alignment: Alignment.center,
          children: [
            IntrinsicHeight(
              child: SizedBox(
                width: size,
                height: size,
                child: CircularProgressIndicator(
                  backgroundColor: Theme.of(context).highlightColor,
                  value: remainedDuration.inMinutes / totalDuration.inMinutes,
                ),
              ),
            ),
            MText(
              text: context.l10n.countdownTime(
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
