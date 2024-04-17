import 'package:flutter/material.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactInfoBottomSheet extends StatelessWidget {
  const ContactInfoBottomSheet({
    required this.mobileNumber,
    super.key,
  });

  final String mobileNumber;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          MText(
            text: context.l10n.contactInfo,
            style: Theme.of(context).textTheme.titleLarge,
            margin: EdgeInsets.all(context.margingS),
          ),
          const Flexible(child: Divider()),
          InkWell(
            onTap: () {
              launchUrl(Uri.parse('tel:$mobileNumber'));
            },
            child: MText(
              text: context.l10n.makeCallTo(mobileNumber),
              style: Theme.of(context).textTheme.titleMedium,
              margin: EdgeInsets.all(context.margingS),
            ),
          ),
          const Flexible(child: Divider()),
          InkWell(
            onTap: () {
              launchUrl(Uri.parse('sms:$mobileNumber'));
            },
            child: MText(
              text: context.l10n.sendSmsTo(mobileNumber),
              style: Theme.of(context).textTheme.titleMedium,
              margin: EdgeInsets.all(context.margingS),
            ),
          ),
        ],
      ).paddingM(),
    );
  }
}
