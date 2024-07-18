import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/m_text.dart';
import 'package:landa/l10n/l10n.dart';

class NoAdvertisementByMeWidget extends StatelessWidget {
  const NoAdvertisementByMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MText(
            text: context.l10n.youHaveNotCreatedAnyAdsYet,
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
          ).paddingL(),
          TextButton(
            onPressed: () {
              context.goNamed(RouteNames.createAdvertisement);
            },
            child: MText(
              text: context.l10n.createAdvertisement,
            ),
          ),
        ],
      ),
    );
  }
}
