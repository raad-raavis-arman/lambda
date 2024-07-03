import 'package:flutter/material.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/l10n/l10n.dart';

class DashboardBottomNavigation extends StatelessWidget {
  const DashboardBottomNavigation({
    required this.currentIndex,
    this.onTap,
    super.key,
  });

  final int currentIndex;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        if (index != currentIndex) {
          onTap?.call(index);
        }
      },
      items: [
        BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.home,
            size: context.iconS,
          ),
          icon: Icon(
            Icons.home_outlined,
            size: context.iconS,
          ),
          label: context.l10n.advertisements,
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.manage_accounts_rounded,
            size: context.iconS,
          ),
          icon: Icon(
            Icons.manage_accounts_outlined,
            size: context.iconS,
          ),
          label: context.l10n.profile,
        ),
      ],
    );
  }
}
