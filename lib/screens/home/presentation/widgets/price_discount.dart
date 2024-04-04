import 'package:flutter/material.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';

class PriceDiscount extends StatelessWidget {
  const PriceDiscount({
    required this.realPrice,
    required this.discount,
    required this.discountedPrice,
    super.key,
  });

  final double realPrice;
  final double discount;
  final double discountedPrice;

  @override
  Widget build(BuildContext context) {
    final realPriceFormatted =
        realPrice.toString().separate(textType: TextType.double);
    final discountedPriceFormatted = discountedPrice
        .toString()
        .separate(textType: TextType.double);
    final discountFormatted = ' ⬅️ $discount٪ ⬅️ ';
    return Row(
      children: [
        MText(
          text: context.l10n.tmn(realPriceFormatted),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                decoration: TextDecoration.lineThrough,
              ),
        ),
        MText(
          text: discountFormatted.replaceEnNumToFa(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        MText(
          text: context.l10n.tmn(discountedPriceFormatted),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
