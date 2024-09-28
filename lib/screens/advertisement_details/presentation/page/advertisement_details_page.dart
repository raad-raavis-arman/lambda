import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/bloc/bloc.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/di_service.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/advertisement_details/presentation/presentation.dart';
import 'package:landa/screens/shared/domain/advertisements/entities/entities.dart';
import 'package:landa/screens/shared/presentaion/widgets/widgets.dart';

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
          return SlideTransitionPage(
            child: AdvertisementDetailsPage(
              advertisement: advertisement!,
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdvertisementDetailsBloc(
        locator.get(),
        locator.get(),
      ),
      child: _AdvertisementDetailsView(advertisement),
    );
  }
}

class _AdvertisementDetailsView extends StatefulWidget {
  const _AdvertisementDetailsView(this.advertisement);

  final Advertisement advertisement;

  @override
  State<_AdvertisementDetailsView> createState() =>
      _AdvertisementDetailsViewState();
}

class _AdvertisementDetailsViewState extends State<_AdvertisementDetailsView> {
  late Advertisement advertisement = widget.advertisement;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AdvertisementDetailsBloc, AdvertisementDetailsState>(
      listenWhen: (previous, current) {
        return previous.bookmarkStatus != current.bookmarkStatus;
      },
      listener: (context, state) {
        if (state.bookmarkStatus == StateStatus.error) {
          //revert isMarked when failed to change bookmark
          // because internet error or s.th else
          setState(() {
            advertisement = advertisement.copyWith(
              isMarked: !advertisement.isMarked,
            );
          });
          Fluttertoast.showToast(msg: context.l10n.sthWentWrong);
        }
      },
      child: MScaffold(
        scrollable: true,
        appBar: AppBar(
          centerTitle: true,
          title: MText(
            text: context.l10n.advertisementDetails,
          ),
          leading: BackButton(
            onPressed: () {
              final updatedAd =
                  widget.advertisement != advertisement ? advertisement : null;
              context.pop(updatedAd);
            },
          ),
        ),
        body: Column(
          children: [
            Center(
              child: CountDownTime(
                expireDateTime: DateTime.parse(advertisement.pExpireDateTime),
                creationDateTime: DateTime.parse(
                  advertisement.pCreateDateTime,
                ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton.outlined(
                            onPressed: () {
                              context.read<AdvertisementDetailsBloc>().add(
                                    ToggleBookmarkAdvertisementEvent(
                                      advertisementId: advertisement.id,
                                      isMarked: advertisement.isMarked,
                                    ),
                                  );
                              setState(() {
                                advertisement = advertisement.copyWith(
                                  isMarked: !advertisement.isMarked,
                                );
                              });
                            },
                            icon: Icon(
                              advertisement.isMarked
                                  ? Icons.bookmark
                                  : Icons.bookmark_add_outlined,
                              size: context.iconS,
                            ),
                          ),
                          MText(
                            text: '${context.l10n.publishTime}: ${getAgo(
                              postDate: advertisement.adCreateDateTime,
                              isPersian: context.isPersian,
                            )}',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                      MDivider(text: context.l10n.price),
                      PriceDiscount(
                        style: Theme.of(context).textTheme.labelMedium,
                        realPrice: advertisement.originalPrice,
                        discount: advertisement.discount,
                        discountedPrice: advertisement.discountedPrice,
                        margin: EdgeInsets.all(context.marginS),
                      ),
                      MDivider(text: context.l10n.category),
                      MText(
                        text:
                            '${advertisement.subCategory.nameFa}/${advertisement.category.nameFa}',
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
                        text: advertisement.pCreateDateTime
                            .utcToJalaliFormatter(),
                        margin: EdgeInsets.all(context.marginS),
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      MDivider(text: context.l10n.expirationDate),
                      MText(
                        text: advertisement.pExpireDateTime
                            .utcToJalaliFormatter(),
                        margin: EdgeInsets.all(context.marginS),
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      MDivider(text: context.l10n.description),
                      MText(
                        text: advertisement.description ?? '',
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
      ),
    );
  }
}
