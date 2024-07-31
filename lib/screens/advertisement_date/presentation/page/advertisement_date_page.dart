import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/advertisement_date/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class AdvertisementDatePage extends StatelessWidget {
  const AdvertisementDatePage({
    super.key,
    this.initialCreationDate,
    this.initialExpirationDate,
  });

  final MDatePickerValue? initialCreationDate;
  final MDatePickerValue? initialExpirationDate;

  static GoRoute get route => GoRoute(
        path: RouteNames.advertisementDate,
        name: RouteNames.advertisementDate,
        pageBuilder: (context, state) {
          final data = state.extra as List<MDatePickerValue>?;
          return SlideTransitionPage(
            child: AdvertisementDatePage(
              initialCreationDate: data?.first,
              initialExpirationDate: data?.last,
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return _AdvertisementDateView(
      initialCreationDate,
      initialExpirationDate,
    );
  }
}

class _AdvertisementDateView extends StatelessWidget {
  const _AdvertisementDateView(
    this.initialCreationDate,
    this.initialExpirationDate,
  );
  final MDatePickerValue? initialCreationDate;
  final MDatePickerValue? initialExpirationDate;

  @override
  Widget build(BuildContext context) {
    late MDatePickerValue productionDateTime;
    late MDatePickerValue expirationDateTime;
    return MScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: MText(text: context.l10n.creationAndExpirationDate),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MDatePicker(
            initialValue: initialCreationDate,
            title: context.l10n.creationDate,
            onChage: (value) {
              productionDateTime = value;
            },
          ),
          const SizedBox.shrink().paddingXL(),
          MDatePicker(
            initialValue: initialExpirationDate,
            title: context.l10n.expirationDate,
            onChage: (value) {
              expirationDateTime = value;
            },
          ),
        ],
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          if (productionDateTime.toJalaliDateTime().isAfter(
                expirationDateTime.toJalaliDateTime(),
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
              productionDateTime,
              expirationDateTime,
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
