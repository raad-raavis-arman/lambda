import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/advertisement_date/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class AdvertisementDatePage extends StatelessWidget {
  const AdvertisementDatePage({super.key});

  static GoRoute get route => GoRoute(
        path: RouteNames.advertisementDate,
        name: RouteNames.advertisementDate,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: AdvertisementDatePage(),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return const _AdvertisementDateView();
  }
}

class _AdvertisementDateView extends StatelessWidget {
  const _AdvertisementDateView();
  
  @override
  Widget build(BuildContext context) {
    late MDatePickerValue productionDateTime;
    late MDatePickerValue expirationDateTime;
    return MScaffold(
      appBar: AppBar(
        title: MText(text: context.l10n.creationAndExpirationDate),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MDatePicker(
            title: context.l10n.creationDate,
            onChage: (value) {
              productionDateTime = value;
            },
          ),
          const SizedBox.shrink().paddingXL(),
          MDatePicker(
            title: context.l10n.expirationDate,
            onChage: (value) {
              expirationDateTime = value;
            },
          ),
        ],
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          if (productionDateTime.toDateTime().isAfter(
                expirationDateTime.toDateTime(),
              )) {
            Toastification().show(
              context: context,
              type: ToastificationType.error,
              title: MText(text: context.l10n.error),
              description: MText(
                text: context
                    .l10n.creationDateTimeMustNotBeAfterExpirationDateTime,
              ),
            );
            return;
          }
          context.pop(
            [
              productionDateTime.toString(),
              expirationDateTime.toString(),
            ],
          );
        },
        child: MText(
          text: context.l10n.confirm,
        ),
      ),
    );
  }
}
