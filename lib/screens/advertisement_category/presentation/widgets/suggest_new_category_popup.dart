import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/bloc/bloc.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/advertisement_category/presentation/bloc/bloc.dart';

class SuggestNewCategoryPopup extends StatelessWidget {
  const SuggestNewCategoryPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final formStateKey = GlobalKey<FormState>();
    return BlocConsumer<CategoryBloc, CategoryState>(
      buildWhen: (previous, current) {
        return previous.suggestCategorystatus != current.suggestCategorystatus;
      },
      listenWhen: (previous, current) {
        return previous.suggestCategorystatus != current.suggestCategorystatus;
      },
      listener: (context, state) {
        if (state.suggestCategorystatus == StateStatus.error) {
          MToast.showErrorToast(
            msg: context.l10n.failedToSendYourSuggestion,
          );
        } else if (state.suggestCategorystatus == StateStatus.success) {
          MToast.showSuccessToast(
            msg: context.l10n.yourSuggestionSentSuccessfully,
          );
          textController.dispose();
          context.pop();
        }
      },
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(context.marginL),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                context.radiusS,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.l10n.suggestNewCategory,
                style: Theme.of(context).textTheme.titleLarge,
              ).paddingS(),
              SizedBox(
                height: context.marginL,
              ),
              Form(
                key: formStateKey,
                child: TextFormField(
                  controller: textController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: context.l10n.categoryName,
                    labelText: context.l10n.categoryName,
                    suffixIcon: Icon(
                      Icons.category,
                      size: context.iconS,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.length < 3) {
                      return context.l10n.categorySuggestionNameError;
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(
                height: context.marginL,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: state.suggestCategorystatus == StateStatus.loading
                      ? null
                      : () {
                          if (formStateKey.currentState?.validate() ?? false) {
                            context.read<CategoryBloc>().add(
                                  SuggestCategoryEvent(
                                    name: textController.text,
                                  ),
                                );
                          }
                        },
                  label: MText(
                    text: context.l10n.sendSuggestion,
                    style: Theme.of(context).textTheme.titleSmall,
                  ).paddingXS(),
                  icon: Icon(
                    Icons.file_upload_outlined,
                    size: context.iconS,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
