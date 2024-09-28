import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/di_service.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/dashboard/presentation/utils/dashboard_coach_mark_keys.dart';
import 'package:landa/screens/dashboard/presentation/widgets/widgets.dart';
import 'package:landa/screens/home/presentation/page/page.dart';
import 'package:landa/screens/profile/presentation/page/page.dart';
import 'package:landa/screens/shared/presentaion/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

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
  void initState() {
    super.initState();
    if (!(locator
            .get<SharedPreferences>()
            .getBool(PreferenceKeys.dashboardCoached) ??
        false)) {
      Future.delayed(
        const Duration(seconds: 1),
      ).then(
        (_) {
          showTutorialCoach();
        },
      );
    }
  }

  void showTutorialCoach() {
    final targets = [
      TargetFocus(
        keyTarget: DashboardCoachMarkKeys.createAdvKey,
        shape: ShapeLightFocus.RRect,
        radius: context.radiusM,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return CoachMarkDesc(
                next: context.l10n.next,
                skip: context.l10n.skip,
                text: context.l10n.createAdvCoachDesc,
                onNext: () {
                  controller.next();
                },
                onSkip: () {
                  controller.skip();
                },
              );
            },
          ),
        ],
      ),
      TargetFocus(
        keyTarget: DashboardCoachMarkKeys.locationKey,
        contents: [
          TargetContent(
            builder: (context, controller) {
              return CoachMarkDesc(
                next: context.l10n.next,
                skip: context.l10n.skip,
                text: context.l10n.locationFilterCoachDesc,
                onNext: () {
                  controller.next();
                },
                onSkip: () {
                  controller.skip();
                },
              );
            },
          ),
        ],
      ),
      TargetFocus(
        keyTarget: DashboardCoachMarkKeys.searchBarKey,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            builder: (context, controller) {
              return CoachMarkDesc(
                next: context.l10n.next,
                skip: context.l10n.skip,
                text: context.l10n.searchBarCoachDesc,
                onNext: () {
                  controller.next();
                },
                onSkip: () {
                  controller.skip();
                },
              );
            },
          ),
        ],
      ),
    ];
    TutorialCoachMark(
      targets: targets,
      textSkip: context.l10n.skip,
      onFinish: () {
        locator
            .get<SharedPreferences>()
            .setBool(PreferenceKeys.dashboardCoached, true);
      },
    ).show(context: context, rootOverlay: true);
  }

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
        key: DashboardCoachMarkKeys.createAdvKey,
        onPressed: () {
          context.goNamed(RouteNames.createAdvertisement);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
