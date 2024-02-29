import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/l10n/lang/lang_bloc.dart';

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
    final isPersian = context.read<LangBloc>().state.isPersian;
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
            Text(
              context.l10n.countdownTime(
                isPersian
                    ? remainedDuration.days.toString().replaceEnNumToFa()
                    : remainedDuration.days.toString().replaceFaNumToEn(),
                isPersian
                    ? remainedDuration.hours.toString().replaceEnNumToFa()
                    : remainedDuration.hours.toString().replaceFaNumToEn(),
                isPersian
                    ? remainedDuration.minutes.toString().replaceEnNumToFa()
                    : remainedDuration.minutes.toString().replaceFaNumToEn(),
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
