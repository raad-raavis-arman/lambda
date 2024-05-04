import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/advertisement_details/presentation/presentation.dart';
import 'package:landa/screens/home/domain/entities/entities.dart';
import 'package:landa/screens/home/presentation/presentation.dart';

class AdvertisementDetailsPage extends StatelessWidget {
  const AdvertisementDetailsPage({
    required this.advertisement,
    super.key,
  });

  final Advertisement advertisement;

  static GoRoute get route => GoRoute(
        path: RouteNames.advertisementDetails,
        name: RouteNames.advertisementDetails,
        pageBuilder: (context, state) {
          final advertisement = state.extra as Advertisement?;
          return NoTransitionPage(
            child: AdvertisementDetailsPage(
              advertisement: advertisement!,
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return _AdvertisementDetailsView(advertisement);
  }
}

class _AdvertisementDetailsView extends StatelessWidget {
  const _AdvertisementDetailsView(this.advertisement);

  final Advertisement advertisement;

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      scrollable: true,
      appBar: AppBar(
        title: MText(
          text: context.l10n.advertisementDetails,
        ),
        leading: BackButton(
          onPressed: () {
            GoRouter.of(context).goNamed(RouteNames.home);
          },
        ),
      ),
      body: Column(
        children: [
          Center(
            child: CountDownTime(
              expireDateTime: DateTime.parse(advertisement.pExpireDateTime),
              creationDateTime: DateTime.parse(advertisement.pCreateDateTime),
            ),
          ),
          const SizedBox().paddingM(),
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(context.radiusM),
            padding: EdgeInsets.all(context.marginM),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(context.radiusM),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: MText(
                        text: '${context.l10n.publishTime}: ${getAgo(
                          postDate: advertisement.adCreateDateTime,
                          isPersian: context.isPersian,
                        )}',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                    MDivider(text: context.l10n.price),
                    PriceDiscount(
                      style: Theme.of(context).textTheme.labelLarge,
                      realPrice: advertisement.originalPrice,
                      discount: advertisement.discount,
                      discountedPrice: advertisement.discountedPrice,
                      margin: EdgeInsets.all(context.marginS),
                    ),
                    MDivider(text: context.l10n.category),
                    MText(
                      text:
                          '${advertisement.subCategory.title}/${advertisement.category.title}',
                      margin: EdgeInsets.all(context.marginS),
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    MDivider(text: context.l10n.advertisementArea),
                    MText(
                      text:
                          '${advertisement.province.name}/${advertisement.city.name}',
                      style: Theme.of(context).textTheme.labelLarge,
                      margin: EdgeInsets.all(context.marginS),
                    ),
                    MDivider(text: context.l10n.creationDate),
                    MText(
                      text:
                          advertisement.pCreateDateTime.utcToJalaliFormatter(),
                      margin: EdgeInsets.all(context.marginS),
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    MDivider(text: context.l10n.expirationDate),
                    MText(
                      text:
                          advertisement.pExpireDateTime.utcToJalaliFormatter(),
                      margin: EdgeInsets.all(context.marginS),
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    MDivider(text: context.l10n.description),
                    MText(
                      text: advertisement.description,
                      margin: EdgeInsets.all(context.marginS),
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => ContactInfoBottomSheet(
              mobileNumber: advertisement.contactNumber,
            ),
          );
        },
        child: MText(
          text: context.l10n.contactInfo,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
