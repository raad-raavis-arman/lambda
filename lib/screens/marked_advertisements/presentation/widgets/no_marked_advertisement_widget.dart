import 'package:flutter/material.dart';
import 'package:landa/core/widgets/m_text.dart';
import 'package:landa/l10n/l10n.dart';

class NoMarkedAdvertisementWidget extends StatelessWidget {
  const NoMarkedAdvertisementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MText(
            text: context.l10n.thereIsNoMarkedAdToShow,
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
          ),
    );
  }
}
