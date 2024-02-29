import 'package:flutter/material.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/screens/home/presentation/widgets/widgets.dart';

class AdvertisementItem extends StatelessWidget {
  const AdvertisementItem({super.key});

  String get imageUrl =>
      'https://drinkmilk.co.uk/wp-content/uploads/2021/02/Office-Milk-Bottles-Shelf.png';

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
          AdvertisementImage(imageUrl: imageUrl),
          const SizedBox().paddingXS(),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelLarge,
                  maxLines: 1,
                ),
                Text(
                  description,
                  style: Theme.of(context).textTheme.labelSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const PriceDiscount(),
              ],
            ),
          ),
          CountDownTime(
            expireDateTime: exprireDateTime,
            creationDateTime: creationDateTime,
          ),
        ],
      ).paddingS(),
    );
  }
}
