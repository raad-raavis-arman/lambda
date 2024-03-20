import 'package:flutter/material.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';

class NewVersionPopup extends StatelessWidget {
  const NewVersionPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return MPopup(
      title: context.l10n.newVersionChanges,
      description: context.l10n.features,
      buttonLabel: context.l10n.confirm,
    );
  }
}
