import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';

class AdvertisementContactInfoPage extends StatelessWidget {
  const AdvertisementContactInfoPage({required this.mobileNumber, super.key});

  final String mobileNumber;

  static GoRoute get route => GoRoute(
        path: RouteNames.advertisementContactInfo,
        name: RouteNames.advertisementContactInfo,
        pageBuilder: (context, state) {
          final mobileNumber = state.extra as String? ?? '';
          return NoTransitionPage(
            child: AdvertisementContactInfoPage(
              mobileNumber: mobileNumber,
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return _AdvertisementContactInfoView(mobileNumber: mobileNumber,);
  }
}

class _AdvertisementContactInfoView extends StatefulWidget {
  const _AdvertisementContactInfoView({required this.mobileNumber});

  final String mobileNumber;

  @override
  State<_AdvertisementContactInfoView> createState() =>
      _AdvertisementContactInfoViewState();
}

class _AdvertisementContactInfoViewState
    extends State<_AdvertisementContactInfoView> with MobileNumberValidator {
  final formKey = GlobalKey<FormState>();
  String contactNumber = '';
  final checkBoxNotifier = ValueNotifier(false);

  @override
  void dispose() {
    checkBoxNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: AppBar(
        title: MText(text: context.l10n.contactInfo),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              initialValue: widget.mobileNumber,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: context.margingXS),
                labelText: context.l10n.mobileNumber,
                labelStyle: Theme.of(context).textTheme.titleMedium,
                suffixIcon: const Icon(Icons.contact_phone),
              ),
              validator: (value) {
                if (validateMobileNumber(value ?? '')) {
                  return null;
                } else {
                  return '';
                }
              },
              inputFormatters: [
                if (context.isPersian)
                  TextFieldPersianFormatter()
                else
                  TextFieldEnglishFormatter(),
              ],
              onSaved: (newValue) {
                contactNumber = newValue ?? '';
              },
            ),
            const SizedBox.shrink().paddingM(),
            ValueListenableBuilder(
              valueListenable: checkBoxNotifier,
              builder: (_, value, __) => CheckboxListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: context.margingXS),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: const BorderSide(width: 0.4),
                ),
                title: MText(
                  text: context.l10n.dontShowMyNumberInAdvertisement,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                value: value,
                onChanged: (newValue) {
                  if (newValue != null) checkBoxNotifier.value = newValue;
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          if (formKey.currentState?.validate() ?? false) {
            formKey.currentState?.save();
            context.pop([
              contactNumber,
              checkBoxNotifier.value.toString(),
            ]);
          }
        },
        child: MText(
          text: context.l10n.confirm,
        ),
      ),
    );
  }
}
