import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/logger/logger.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';

class CreateAdvertisementPage extends StatelessWidget {
  const CreateAdvertisementPage({super.key});

  static GoRoute get route => GoRoute(
        path: RouteNames.createAdvertisement,
        name: RouteNames.createAdvertisement,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: CreateAdvertisementPage(),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return const _CreateAdvertisementView();
  }
}

class _CreateAdvertisementView extends StatelessWidget {
  const _CreateAdvertisementView();

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      body: const Center(
        child: MText(text: 'Create Advertisement Page'),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () async {
          final category = await context.pushNamed(RouteNames.category);
          logger.i('selected category: $category');
        },
        child: const MText(text: 'Advertisement'),
      ),
    );
  }
}
