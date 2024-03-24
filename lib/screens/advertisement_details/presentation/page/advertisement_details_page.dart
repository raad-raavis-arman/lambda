import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/router/router.dart';
import 'package:landa/core/widgets/widgets.dart';

class AdvertisementDetailsPage extends StatelessWidget {
  const AdvertisementDetailsPage({super.key});

  static GoRoute get route => GoRoute(
        path: RouteNames.advertisementDetails,
        name: RouteNames.advertisementDetails,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: AdvertisementDetailsPage(),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return const _AdvertisementDetailsView();
  }
}

class _AdvertisementDetailsView extends StatelessWidget {
  const _AdvertisementDetailsView();

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: AppBar(
        title: const MText(text: 'جزییات آگهی'),
        leading: BackButton(
          onPressed: () {
            GoRouter.of(context).goNamed(RouteNames.home);
          },
        ),
      ),
      body: const Center(
        child: Text('به زودی این قابلیت فعال میشود'),
      ),
    );
  }
}
