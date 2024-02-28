import 'package:flutter/material.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/screens/home/presentation/widgets/widgets.dart';

class AdvertisementItem extends StatelessWidget {
  const AdvertisementItem({super.key});

  String get imageUrl =>
      'https://drinkmilk.co.uk/wp-content/uploads/2021/02/Office-Milk-Bottles-Shelf.png';

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 60,
              height: 60,
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'شیر تازه',
                  style: Theme.of(context).textTheme.labelLarge,
                  maxLines: 1,
                ),
                Text(
                  'تعداد خیلی زیاد از شیر موجود میباشد برای استفاده سریع',
                  style: Theme.of(context).textTheme.labelSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const PriceDiscount(),
              ],
            ),
          ),
          const CountDownTime(),
        ],
      ).paddingS(),
    );
  }
}
