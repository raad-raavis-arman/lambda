import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/di_service.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/profile/presentation/bloc/bloc.dart';
import 'package:landa/screens/profile/presentation/widgets/widgets.dart';
import 'package:landa/screens/shared/presentaion/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static GoRoute get route => GoRoute(
        path: RouteNames.profile,
        name: RouteNames.profile,
        pageBuilder: (context, state) {
          return SlideTransitionPage(
            child: const ProfilePage(),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    final mobileNumber =
        locator.get<SharedPreferences>().getUser()?.mobileNumber ?? '';
    final profileBloc = ProfileBloc(
      locator.get(),
    );
    return BlocProvider(
      create: (context) => profileBloc,
      child: _ProfileView(
        mobileNumber,
        profileBloc,
      ),
    );
  }
}

class _ProfileView extends StatefulWidget {
  const _ProfileView(
    this.mobileNumber,
    this.profileBloc,
  );

  final String mobileNumber;
  final ProfileBloc profileBloc;

  @override
  State<_ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<_ProfileView> {
  //
  final myAdvKey = GlobalKey();
  final mySavedAdvKey = GlobalKey();
  final registerRecommendationKey = GlobalKey();
  final logoutKey = GlobalKey();
  //

  @override
  void initState() {
    super.initState();
    if (!(locator
            .get<SharedPreferences>()
            .getBool(PreferenceKeys.profileCoached) ??
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
        keyTarget: myAdvKey,
        shape: ShapeLightFocus.RRect,
        radius: context.radiusM,
        contents: [
          TargetContent(
            builder: (context, controller) {
              return CoachMarkDesc(
                next: context.l10n.next,
                skip: context.l10n.skip,
                text: context.l10n.myAdvCoachDesc,
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
        keyTarget: mySavedAdvKey,
        shape: ShapeLightFocus.RRect,
        radius: context.radiusM,
        contents: [
          TargetContent(
            builder: (context, controller) {
              return CoachMarkDesc(
                next: context.l10n.next,
                skip: context.l10n.skip,
                text: context.l10n.mySavedAdvCoachDesc,
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
        keyTarget: registerRecommendationKey,
        shape: ShapeLightFocus.RRect,
        radius: context.radiusM,
        contents: [
          TargetContent(
            builder: (context, controller) {
              return CoachMarkDesc(
                next: context.l10n.next,
                skip: context.l10n.skip,
                text: context.l10n.registerRecommendationCoachDesc,
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
        keyTarget: logoutKey,
        shape: ShapeLightFocus.RRect,
        radius: context.radiusM,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return CoachMarkDesc(
                next: context.l10n.next,
                skip: context.l10n.skip,
                text: context.l10n.logoutCoachDesc,
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
            .setBool(PreferenceKeys.profileCoached, true);
      },
    ).show(context: context, rootOverlay: true);
  }

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      scrollable: true,
      appBar: AppBar(
        centerTitle: true,
        title: MText(
          text: context.l10n.youLoggedInWithThisMobileNumber(
            widget.mobileNumber,
          ),
          style: Theme.of(context).textTheme.titleMedium,
          maxLines: 3,
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /*SelectableItemButton(
            title: context.l10n.editProfile,
            margin: EdgeInsets.only(top: context.marginM),
            onClick: () {},
            icon: Icon(
              FontAwesomeIcons.userPen,
              size: context.iconS,
            ),
          ),*/
          SelectableItemButton(
            key: myAdvKey,
            title: context.l10n.myAdvertisements,
            margin: EdgeInsets.only(top: context.marginM),
            onClick: () {
              context.pushNamed(RouteNames.myAdvertisements);
            },
            icon: Icon(
              FontAwesomeIcons.list,
              size: context.iconS,
            ),
          ),
          SelectableItemButton(
            key: mySavedAdvKey,
            title: context.l10n.bookmarkedAdvertisements,
            margin: EdgeInsets.only(top: context.marginM),
            onClick: () {
              context.pushNamed(RouteNames.markedAdvertisements);
            },
            icon: Icon(
              FontAwesomeIcons.solidBookmark,
              size: context.iconS,
            ),
          ),
          /*SelectableItemButton(
            title: context.l10n.enrollCampaign,
            margin: EdgeInsets.only(top: context.marginM),
            onClick: () {},
            icon: Icon(
              FontAwesomeIcons.usersLine,
              size: context.iconS,
            ),
          ),*/
          SelectableItemButton(
            key: registerRecommendationKey,
            title: context.l10n.registerCommentAndRecommends,
            margin: EdgeInsets.only(top: context.marginM),
            onClick: () {
              context.pushNamed(RouteNames.recommendations);
            },
            icon: Icon(
              FontAwesomeIcons.solidPenToSquare,
              size: context.iconS,
            ),
          ),
          SelectableItemButton(
            key: logoutKey,
            title: context.l10n.logoutFromAccount,
            margin: EdgeInsets.only(top: context.marginM),
            onClick: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => SignoutWarningBottomSheet(
                  profileBloc: widget.profileBloc,
                ),
              );
            },
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
