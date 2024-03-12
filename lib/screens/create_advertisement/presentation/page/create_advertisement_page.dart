import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/logger/logger.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/advertisement_category/domain/entities/entities.dart';

class CreateAdvertisementPage extends StatelessWidget {
  const CreateAdvertisementPage({super.key});

  static GoRoute get route => GoRoute(
        path: RouteNames.createAdvertisement,
        name: RouteNames.createAdvertisement,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: CreateAdvertisementPage(),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return const _CreateAdvertisementView();
  }
}

class _CreateAdvertisementView extends StatefulWidget {
  const _CreateAdvertisementView();

  @override
  State<_CreateAdvertisementView> createState() =>
      _CreateAdvertisementViewState();
}

class _CreateAdvertisementViewState extends State<_CreateAdvertisementView> {
  final formKey = GlobalKey<FormState>();

  final categoryController = TextController();

  @override
  void dispose() {
    categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: AppBar(
        title: MText(text: context.l10n.newAdvertisement),
      ),
      scrollable: true,
      body: Form(
        key: formKey,
        child: Column(
          children: [
            SelectableItemFormButton(
              title: context.l10n.category,
              textController: categoryController,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return '';
                } else {
                  return null;
                }
              },
              onSaved: (newValue) {},
              onClick: () async {
                final data = await context.pushNamed(RouteNames.category);
                if (data != null) {
                  final category = (data as List<Object>)[0] as Category;
                  final subCategory = data[1] as SubCategory;
                  categoryController.value =
                      '${category.title}/${subCategory.title}';
                }
              },
            ),
            const SizedBox.shrink().paddingL(),
            TextFormField(
              validator: (value) {
                if ((value?.length ?? 0) < 3) {
                  return '';
                } else {
                  return null;
                }
              },
              onSaved: (newValue) {},
              decoration: InputDecoration(
                hintText: context.l10n.createAdCaptionHint,
                labelText: context.l10n.caption,
              ),
              inputFormatters: [
                if (context.isPersian)
                  TextFieldPersianFormatter()
                else
                  TextFieldEnglishFormatter(),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          if (formKey.currentState?.validate() ?? false) {
            formKey.currentState?.save();
          }
        },
        child: MText(text: context.l10n.publish),
      ),
    );
  }
}
