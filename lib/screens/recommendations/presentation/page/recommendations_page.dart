import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/bloc/state_status.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/di_service.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/recommendations/presentation/bloc/bloc.dart';

class RecommendationsPage extends StatelessWidget {
  const RecommendationsPage({super.key});

  static GoRoute get route => GoRoute(
        path: RouteNames.recommendations,
        name: RouteNames.recommendations,
        pageBuilder: (context, state) {
          return SlideTransitionPage(
            child: const RecommendationsPage(),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecommendationBloc(
        locator.get(),
      ),
      child: const _RecommendationsView(),
    );
  }
}

class _RecommendationsView extends StatelessWidget {
  const _RecommendationsView();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    String subject = '';
    String description = '';
    return BlocConsumer<RecommendationBloc, RecommendationState>(
      listener: (context, state) {
        if (state.status == StateStatus.success) {
          MToast.showSuccessToast(
            msg: context.l10n.yourRecommendationRegisteredSuccessfully,
          );
          context.pop();
        } else if (state.status == StateStatus.error) {
          MToast.showErrorToast(
            msg: context.l10n.yourRecommendationRegisterFailed,
          );
        }
      },
      builder: (context, state) {
        return MScaffold(
          appBar: AppBar(
            centerTitle: true,
            title: MText(
              text: context.l10n.registerCommentAndRecommends,
            ),
          ),
          body: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 255,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.l10n.fillingThisFieldIsRequired;
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    subject = newValue!;
                  },
                  decoration: InputDecoration(
                    labelText: context.l10n.subject,
                    counterText: '',
                  ),
                ),
                SizedBox.fromSize().paddingM(),
                TextFormField(
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.l10n.fillingThisFieldIsRequired;
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    description = newValue!;
                  },
                  decoration: InputDecoration(
                    labelText: context.l10n.description,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: state.status == StateStatus.loading
                        ? null
                        : () {
                            if (formKey.currentState?.validate() ?? false) {
                              formKey.currentState?.save();
                              context.read<RecommendationBloc>().add(
                                    SendRecommendation(
                                      subject: subject,
                                      description: description,
                                    ),
                                  );
                            }
                          },
                    child: state.status == StateStatus.loading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : MText(
                            text: context.l10n.send,
                          ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
