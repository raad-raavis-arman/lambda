import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/extensions/extensions.dart';
import 'package:landa/core/utils/router/router.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/di_service.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static GoRoute get route => GoRoute(
        path: RouteNames.profile,
        name: RouteNames.profile,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: ProfilePage(),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    final mobileNumber =
        locator.get<SharedPreferences>().getUser()?.mobileNumber ?? '';
    return _ProfileView(mobileNumber);
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView(
    this.mobileNumber,
  );

  final String mobileNumber;

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      scrollable: true,
      appBar: AppBar(
        title: MText(
          text: context.l10n.youLoggedInWithThisMobileNumber(
            mobileNumber,
          ),
          style: Theme.of(context).textTheme.titleMedium,
          maxLines: 3,
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SelectableItemButton(
            title: context.l10n.editProfile,
            margin: EdgeInsets.only(top: context.marginM),
            onClick: () {},
            icon: Icon(
              FontAwesomeIcons.userPen,
              size: context.iconS,
            ),
          ),
          SelectableItemButton(
            title: context.l10n.myAdvertisements,
            margin: EdgeInsets.only(top: context.marginM),
            onClick: () {},
            icon: Icon(
              FontAwesomeIcons.list,
              size: context.iconS,
            ),
          ),
          SelectableItemButton(
            title: context.l10n.bookmarkedAdvertisements,
            margin: EdgeInsets.only(top: context.marginM),
            onClick: () {},
            icon: Icon(
              FontAwesomeIcons.solidBookmark,
              size: context.iconS,
            ),
          ),
          SelectableItemButton(
            title: context.l10n.enrollCampaign,
            margin: EdgeInsets.only(top: context.marginM),
            onClick: () {},
            icon: Icon(
              FontAwesomeIcons.usersLine,
              size: context.iconS,
            ),
          ),
          SelectableItemButton(
            title: context.l10n.registerCommentAndRecommends,
            margin: EdgeInsets.only(top: context.marginM),
            onClick: () {},
            icon: Icon(
              FontAwesomeIcons.solidPenToSquare,
              size: context.iconS,
            ),
          ),
          SelectableItemButton(
            title: context.l10n.logoutFromAccount,
            margin: EdgeInsets.only(top: context.marginM),
            onClick: () async {},
            icon: Icon(
              Icons.logout_outlined,
              size: context.iconS,
            ),
          ),
        ],
      ),
    );
  }
}