import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/screens/home/domain/entities/entities.dart';
import 'package:landa/screens/home/presentation/widgets/widgets.dart';

class AdvertisementItem extends StatelessWidget {
  const AdvertisementItem({
    required this.advertisement,
    super.key,
  });

  final Advertisement advertisement;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          RouteNames.advertisementDetails,
          extra: advertisement,
        );
      },
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
