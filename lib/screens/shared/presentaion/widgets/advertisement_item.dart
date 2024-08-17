import 'package:flutter/material.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/shared/domain/advertisements/entities/entities.dart';
import 'package:landa/screens/shared/presentaion/widgets/widgets.dart';

class AdvertisementItem extends StatelessWidget {
  const AdvertisementItem({
    required this.advertisement,
    this.showStatus = false,
    this.onTap,
    super.key,
  });

  final Advertisement advertisement;
  final bool showStatus;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            if (showStatus)
              Container(
                padding: EdgeInsets.symmetric(horizontal: context.marginXS),
                decoration: BoxDecoration(
                  color: advertisement.status == 0
                      ? Theme.of(context).colorScheme.warningColor
                      : advertisement.status == 1
                          ? Theme.of(context).colorScheme.successColor
                          : Theme.of(context).colorScheme.errorColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      context.radiusS,
                    ),
                  ),
                ),
                child: MText(
                  text: advertisement.status == 0
                      ? context.l10n.underReview
                      : advertisement.status == 1
                          ? context.l10n.confirmed
                          : context.l10n.rejected,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
              ),
            CountDownTime(
              expireDateTime: DateTime.parse(advertisement.pExpireDateTime),
              creationDateTime: DateTime.parse(advertisement.pCreateDateTime),
            ).paddingL(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MText(
                  text: advertisement.subCategory.nameFa,
                  style: Theme.of(context).textTheme.labelLarge,
                  maxLines: 1,
                ),
                const SizedBox.shrink().paddingXXS(),
                MText(
                  text:
                      '${advertisement.city.provinceName}/${advertisement.city.name}',
                  style: Theme.of(context).textTheme.labelMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox.shrink().paddingXXS(),
                MText(
                  text: getAgo(
                    postDate: advertisement.adCreateDateTime,
                    isPersian: context.isPersian,
                  ),
                ),
                const SizedBox.shrink().paddingXXS(),
                PriceDiscount(
                  realPrice: advertisement.originalPrice,
                  discount: advertisement.discount,
                  discountedPrice: advertisement.discountedPrice,
                ),
              ],
            ).paddingS(),
          ],
        ),
      ),
    );
  }
}
