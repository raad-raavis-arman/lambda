import 'package:flutter/material.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';

class LoadDataFailed extends StatelessWidget {
  const LoadDataFailed({
    super.key,
    this.tryAgain,
    this.errorMessage,
  });

  final VoidCallback? tryAgain;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MText(
            text: errorMessage ?? context.l10n.loadingDataFailed,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          TextButton(
            onPressed: tryAgain,
            child: MText(
              text: context.l10n.tryAgain,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
