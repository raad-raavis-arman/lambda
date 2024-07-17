import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/router/router.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';

class MarkedAdvertisementsPage extends StatelessWidget {
  const MarkedAdvertisementsPage({super.key});

  static GoRoute get route => GoRoute(
        path: RouteNames.markedAdvertisements,
        name: RouteNames.markedAdvertisements,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: MarkedAdvertisementsPage(),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return const _MarkedAdvertisementsPageView();
  }
}

class _MarkedAdvertisementsPageView extends StatelessWidget {
  const _MarkedAdvertisementsPageView();

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: MText(text: context.l10n.bookmarkedAdvertisements),
      ),
      body: const Center(
        child: MText(text: 'hi'),
      ),
    );
  }
}
