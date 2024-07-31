import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/screens/dashboard/presentation/widgets/widgets.dart';
import 'package:landa/screens/home/presentation/page/page.dart';
import 'package:landa/screens/profile/presentation/page/page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static GoRoute get route => GoRoute(
        path: RouteNames.dashboard,
        name: RouteNames.dashboard,
        pageBuilder: (context, state) {
          return SlideTransitionPage(
            child: const DashboardPage(),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return const _DashboardView();
  }
}

class _DashboardView extends StatefulWidget {
  const _DashboardView();

  @override
  State<_DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<_DashboardView> {
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      body: switch (currentTabIndex) {
        0 => const HomePage(),
        1 => const ProfilePage(),
        _ => const SizedBox.shrink(),
      },
      bottomNavigationBar: DashboardBottomNavigation(
        currentIndex: currentTabIndex,
        onTap: (index) {
          setState(() {
            currentTabIndex = index;
          });
        },
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed(RouteNames.createAdvertisement);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
