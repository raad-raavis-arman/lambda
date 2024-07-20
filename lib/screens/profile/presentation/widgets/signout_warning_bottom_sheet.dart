import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/bloc/state_status.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/profile/presentation/bloc/bloc.dart';

class SignoutWarningBottomSheet extends StatelessWidget {
  const SignoutWarningBottomSheet({
    required this.profileBloc,
    super.key,
  });

  final ProfileBloc profileBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: profileBloc,
      child: const _SignoutWarningView(),
    );
  }
}

class _SignoutWarningView extends StatelessWidget {
  const _SignoutWarningView();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.status == StateStatus.success) {
          context
            ..pop(true)
            ..goNamed(RouteNames.login);
        }
      },
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(context.marginS),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MText(
                  text: context.l10n.logoutFromAccount,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: context.marginL,
                ),
                MText(
                  text: context.l10n.doYouWantToSignout,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(
                  height: context.marginM,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: ElevatedButton(
                        onPressed: state.status == StateStatus.loading
                            ? null
                            : () {
                                context.read<ProfileBloc>().add(
                                      SignoutEvent(),
                                    );
                              },
                        child: MText(
                          text: context.l10n.yes,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.marginM,
                    ),
                    Expanded(
                      flex: 5,
                      child: OutlinedButton(
                        onPressed: () {
                          context.pop(false);
                        },
                        child: MText(
                          text: context.l10n.no,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
