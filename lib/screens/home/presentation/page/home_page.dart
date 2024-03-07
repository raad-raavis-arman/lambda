import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/screens/home/presentation/presentation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static GoRoute get route => GoRoute(
        path: RouteNames.home,
        name: RouteNames.home,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: HomePage(),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return const _HomeView();
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
        },
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (_, __) {
            return const AdvertisementItem();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed(RouteNames.createAdvertisement);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
