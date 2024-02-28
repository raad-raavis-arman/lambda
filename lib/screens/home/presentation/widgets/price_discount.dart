import 'package:flutter/material.dart';

class PriceDiscount extends StatelessWidget {
  const PriceDiscount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '۲۵۰۰۰ تومان',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                decoration: TextDecoration.lineThrough,
              ),
        ),
        Text(
          ' ⬅️ ۱۰٪ ⬅️',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        Text(
          '۲۲۵۰۰ تومان',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
