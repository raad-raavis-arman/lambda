import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';

class CreateAdvertisementPage extends StatelessWidget {
  const CreateAdvertisementPage({super.key});

  static GoRouterPageBuilder get routeBuilder => (context, state) {
        return const NoTransitionPage(
          child: CreateAdvertisementPage(),
        );
      };

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
        onPressed: () {
          context.goNamed(RouteNames.category);
        },
        child: const MText(text: 'Advertisement'),
      ),
    );
  }
}
