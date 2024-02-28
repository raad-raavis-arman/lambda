import 'dart:math';

import 'package:flutter/material.dart';

class CountDownTime extends StatelessWidget {
  const CountDownTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        IntrinsicHeight(
          child: SizedBox(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).highlightColor,
              value: Random().nextDouble(),
            ),
          ),
        ),
        Text(
          '۱۰ روز \n ۵ ساعت \n ۲۰ دقیقه \n مانده',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
