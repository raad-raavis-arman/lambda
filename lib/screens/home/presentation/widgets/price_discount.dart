import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/l10n/lang/lang_bloc.dart';

class PriceDiscount extends StatelessWidget {
  const PriceDiscount({
    required this.realPrice,
    required this.discount,
    super.key,
  });

  final double realPrice;
  final double discount;

  @override
  Widget build(BuildContext context) {
    final isPersian = context.read<LangBloc>().state.isPersian;
    final realPriceFormatted =
        realPrice.toString().separate(textType: TextType.double);
    final discountedPriceFormatted = (realPrice * (1 - (discount / 100)))
        .toString()
        .separate(textType: TextType.double);
    final discountFormatted = ' ⬅️ $discount٪ ⬅️ ';
    return Row(
      children: [
        Text(
          isPersian
              ? context.l10n.tmn(realPriceFormatted).replaceEnNumToFa()
              : context.l10n.tmn(realPriceFormatted).replaceFaNumToEn(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                decoration: TextDecoration.lineThrough,
              ),
        ),
        Text(
          isPersian
              ? discountFormatted.replaceEnNumToFa()
              : discountFormatted.replaceFaNumToEn(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        Text(
          isPersian
              ? context.l10n.tmn(discountedPriceFormatted).replaceEnNumToFa()
              : context.l10n.tmn(discountedPriceFormatted).replaceFaNumToEn(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
