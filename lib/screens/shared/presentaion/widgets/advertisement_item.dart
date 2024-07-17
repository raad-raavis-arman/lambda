import 'package:flutter/material.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/screens/shared/domain/advertisements/entities/entities.dart';
import 'package:landa/screens/shared/presentaion/widgets/widgets.dart';

class AdvertisementItem extends StatelessWidget {
  const AdvertisementItem({
    required this.advertisement,
    this.onTap,
    super.key,
  });

  final Advertisement advertisement;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            CountDownTime(
              expireDateTime: DateTime.parse(advertisement.pExpireDateTime),
              creationDateTime: DateTime.parse(advertisement.pCreateDateTime),
            ),
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
            ),
          ],
        ).paddingS(),
      ),
    );
  }
}
