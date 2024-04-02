import 'package:flutter/material.dart';
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

  String get title => 'شیر تازه';
  String get description =>
      'تعداد خیلی زیاد از شیر موجود میباشد برای استفاده سریع';

  DateTime get exprireDateTime => DateTime.now().add(const Duration(days: 18));
  DateTime get creationDateTime => DateTime.now().subtract(
        const Duration(days: 50),
      );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MText(
                  text: advertisement.title,
                  style: Theme.of(context).textTheme.labelLarge,
                  maxLines: 1,
                ),
                const SizedBox.shrink().paddingXXS(),
                MText(
                  text: advertisement.description,
                  style: Theme.of(context).textTheme.labelMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox.shrink().paddingXXS(),
                PriceDiscount(
                  realPrice: advertisement.originalPrice,
                  discount: advertisement.discount,
                ),
              ],
            ),
          ),
          CountDownTime(
            expireDateTime: DateTime.parse(advertisement.pExpireDateTime),
            creationDateTime: DateTime.parse(advertisement.pCreateDateTime),
          ),
        ],
      ).paddingS(),
    );
  }
}
