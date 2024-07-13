import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  static Page get page => const MaterialPage(
        child: NotFoundPage(),
      );

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MText(
              textAlign: TextAlign.center,
              text: context.l10n.yourDesiredPageNotFound,
              style: Theme.of(context).textTheme.bodyLarge,
            ).paddingM(),
            TextButton(
              onPressed: () {
                context.goNamed(
                  RouteNames.dashboard,
                );
              },
              child: MText(
                text: context.l10n.advertisements,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
