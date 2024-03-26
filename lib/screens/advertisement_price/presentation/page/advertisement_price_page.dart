import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/extensions/double/decimal_format_extension.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';

class AdvertisementPricePage extends StatelessWidget {
  const AdvertisementPricePage({super.key});

  static GoRoute get route => GoRoute(
        path: RouteNames.advertisementPrice,
        name: RouteNames.advertisementPrice,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: AdvertisementPricePage(),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return const _AdvertisementPriceView();
  }
}

class _AdvertisementPriceView extends StatefulWidget {
  const _AdvertisementPriceView();

  @override
  State<_AdvertisementPriceView> createState() =>
      _AdvertisementPriceViewState();
}

class _AdvertisementPriceViewState extends State<_AdvertisementPriceView> {
  final formKey = GlobalKey<FormState>();
  final originalPriceController = TextEditingController(text: ' ');
  final discountController = TextEditingController(text: ' ');
  final finalPriceController = TextEditingController(text: '-');

  @override
  void dispose() {
    originalPriceController.dispose();
    discountController.dispose();
    finalPriceController.dispose();
    super.dispose();
  }

  double calcFinalPrice(double discount, double originalPrice) {
    return ((100.0 - discount) * originalPrice) / 100.0;
  }

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: AppBar(
        title: MText(text: context.l10n.price),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              textAlign: TextAlign.center,
              controller: originalPriceController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: Theme.of(context).textTheme.titleMedium,
              inputFormatters: [
                if (context.isPersian)
                  TextFieldPersianFormatter()
                else
                  TextFieldEnglishFormatter(),
                NumberSeparatorFormatter(),
              ],
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: context.margingXS),
                suffix: MText(
                  text: context.l10n.tooman,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                labelText: context.l10n.originalPrice,
                labelStyle: Theme.of(context).textTheme.titleMedium,
              ),
              validator: (value) {
                if ((value?.parseDouble() ?? 0) > 0) {
                  return null;
                } else {
                  return context.l10n.fillingThisFieldIsRequired;
                }
              },
              onChanged: (origianl) {
                final result = calcFinalPrice(
                  discountController.text.parseDouble(),
                  origianl.parseDouble(),
                ).format();
                if (context.isPersian) {
                  finalPriceController.text = result.replaceEnNumToFa();
                } else {
                  finalPriceController.text = result.replaceFaNumToEn();
                }
              },
            ),
            const SizedBox.shrink().paddingM(),
            TextFormField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              controller: discountController,
              textInputAction: TextInputAction.done,
              inputFormatters: [
                if (context.isPersian)
                  TextFieldPersianFormatter()
                else
                  TextFieldEnglishFormatter(),
                const InputNumberRangeLimited(begin: 0, end: 100),
              ],
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: context.margingXS),
                suffix: MText(
                  text: context.l10n.percentage,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                labelText: context.l10n.discountPercentage,
                labelStyle: Theme.of(context).textTheme.titleMedium,
              ),
              style: Theme.of(context).textTheme.titleMedium,
              onChanged: (discount) {
                final result = calcFinalPrice(
                  discount.parseDouble(),
                  originalPriceController.text.parseDouble(),
                ).format();
                if (context.isPersian) {
                  finalPriceController.text = result.replaceEnNumToFa();
                } else {
                  finalPriceController.text = result.replaceFaNumToEn();
                }
              },
            ),
            const SizedBox.shrink().paddingXL(),
            TextFormField(
              controller: finalPriceController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: Theme.of(context).textTheme.titleMedium,
              readOnly: true,
              inputFormatters: [
                if (context.isPersian)
                  TextFieldPersianFormatter()
                else
                  TextFieldEnglishFormatter(),
                NumberSeparatorFormatter(),
              ],
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: context.margingXS),
                suffix: MText(
                  text: context.l10n.tooman,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                labelText: context.l10n.finalPriceAfterDiscount,
                labelStyle: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          if (formKey.currentState?.validate() ?? false) {
            formKey.currentState?.save();
            context.pop(
              finalPriceController.text,
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
