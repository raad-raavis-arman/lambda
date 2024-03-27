import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jalalidatepicker/jalalidatepicker.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';

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

class _AdvertisementDateView extends StatefulWidget {
  const _AdvertisementDateView();

  @override
  State<_AdvertisementDateView> createState() => _AdvertisementDateViewState();
}

class _AdvertisementDateViewState extends State<_AdvertisementDateView> {
  final formKey = GlobalKey<FormState>();
  final productionDateController = TextEditingController();
  final expirationDateController = TextEditingController();

  @override
  void dispose() {
    productionDateController.dispose();
    expirationDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: AppBar(
        title: MText(text: context.l10n.creationAndExpirationDate),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: productionDateController,
              textAlign: TextAlign.center,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: Theme.of(context).textTheme.titleMedium,
              readOnly: true,
              validator: (value) {
                if (value?.trim().isEmpty ?? true) {
                  return context.l10n.fillingThisFieldIsRequired;
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: context.margingXS),
                labelText: context.l10n.creationDate,
                labelStyle: Theme.of(context).textTheme.titleMedium,
                suffixIcon: const Icon(Icons.date_range),
              ),
              onTap: () async {
                final result = await jalaliCalendarPicker(
                  context: context,
                  showTimePicker: true,
                  hore24Format: true,
                  selectedFormat: 'yyyy-mm-dd HH:nn',
                );
                if (result != null) {
                  productionDateController.text = result.replaceEnNumToFa();
                }
              },
            ),
            const SizedBox.shrink().paddingXL(),
            TextFormField(
              controller: expirationDateController,
              textAlign: TextAlign.center,
              readOnly: true,
              style: Theme.of(context).textTheme.titleMedium,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: context.margingXS),
                labelText: context.l10n.expirationDate,
                labelStyle: Theme.of(context).textTheme.titleMedium,
                suffixIcon: const Icon(Icons.date_range),
              ),
              validator: (value) {
                if (value?.trim().isEmpty ?? true) {
                  return '';
                } else {
                  return null;
                }
              },
              onTap: () async {
                final result = await jalaliCalendarPicker(
                  context: context,
                  showTimePicker: true,
                  hore24Format: true,
                  selectedFormat: 'yyyy-mm-dd HH:nn',
                );
                if (result != null) {
                  expirationDateController.text = result.replaceEnNumToFa();
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          if (formKey.currentState?.validate() ?? false) {
            formKey.currentState?.save();
            context.pop(
              [
                productionDateController.text,
                expirationDateController.text,
              ],
            );
          }
        },
        child: MText(
          text: context.l10n.confirm,
        ),
      ),
    );
  }
}
