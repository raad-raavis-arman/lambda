import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/controllers/controllers.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/advertisement_area/domain/entities/entities.dart';
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

  final categoryController = MTextEditingController();
  final advertisementAreaController = MTextEditingController();
  final priceController = MTextEditingController();
  final creationAndExpirationDateController = MTextEditingController();
  final contactInfoController = MTextEditingController();
  final titleController = MTextEditingController();
  final descriptionController = MTextEditingController();
  final productCountController = MTextEditingController();

  late final until = context.l10n.until;

  @override
  void dispose() {
    categoryController.dispose();
    advertisementAreaController.dispose();
    priceController.dispose();
    creationAndExpirationDateController.dispose();
    contactInfoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: AppBar(
        title: MText(text: context.l10n.newAdvertisement),
        leading: BackButton(
          onPressed: () {
            context.goNamed(RouteNames.home);
          },
        ),
      ),
      scrollable: true,
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              style: Theme.of(context).textTheme.titleMedium,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textInputAction: TextInputAction.done,
              validator: (value) {
                if ((value?.trim().length ?? 0) < 3) {
                  return context.l10n.fillingThisFieldIsRequired;
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                labelText: context.l10n.caption,
                labelStyle: Theme.of(context).textTheme.titleMedium,
                contentPadding: EdgeInsets.all(context.margingXS),
              ),
              inputFormatters: [
                if (context.isPersian)
                  TextFieldPersianFormatter()
                else
                  TextFieldEnglishFormatter(),
              ],
            ),
            const SizedBox.shrink().paddingM(),
            SelectableItemFormButton(
              title: context.l10n.category,
              textController: categoryController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return context.l10n.fillingThisFieldIsRequired;
                } else {
                  return null;
                }
              },
              onClick: () async {
                final data = await context.pushNamed(RouteNames.category);
                if (data != null) {
                  final category = (data as List<Object>)[0] as Category;
                  final subCategory = data[1] as SubCategory;
                  categoryController
                    ..text = '${category.title}/${subCategory.title}'
                    ..object = data;
                }
              },
            ),
            const SizedBox.shrink().paddingL(),
            SelectableItemFormButton(
              title: context.l10n.advertisementArea,
              textController: advertisementAreaController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return context.l10n.fillingThisFieldIsRequired;
                } else {
                  return null;
                }
              },
              onClick: () async {
                final data =
                    await context.pushNamed(RouteNames.advertisementArea);
                if (data != null) {
                  final city = data as City;
                  advertisementAreaController
                    ..text = '${city.provinceName}/${city.cityName}'
                    ..object = city;
                }
              },
            ),
            const SizedBox.shrink().paddingL(),
            SelectableItemFormButton(
              title: context.l10n.price,
              textController: priceController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return context.l10n.fillingThisFieldIsRequired;
                } else {
                  return null;
                }
              },
              onClick: () {
                context.pushNamed(RouteNames.advertisementPrice).then((data) {
                  if (data != null) {
                    priceController
                      ..text = context.l10n.tmn(data as String)
                      ..object = data;
                  }
                });
              },
            ),
            const SizedBox.shrink().paddingL(),
            TextFormField(
              controller: productCountController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: Theme.of(context).textTheme.titleMedium,
              validator: (value) {
                if (value?.trim().isEmpty ?? true) {
                  return context.l10n.fillingThisFieldIsRequired;
                } else {
                  return null;
                }
              },
              inputFormatters: [
                if (context.isPersian)
                  TextFieldPersianFormatter()
                else
                  TextFieldEnglishFormatter(),
                NumberSeparatorFormatter(),
              ],
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(context.margingXS),
                suffix: MText(
                  text: context.l10n.number,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                labelText: context.l10n.productCount,
                labelStyle: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox.shrink().paddingL(),
            SelectableItemFormButton(
              title: context.l10n.creationAndExpirationDate,
              textController: creationAndExpirationDateController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return context.l10n.fillingThisFieldIsRequired;
                } else {
                  return null;
                }
              },
              onClick: () async {
                final result =
                    await context.pushNamed(RouteNames.advertisementDate);
                if (result != null) {
                  final List<String> data = result as List<String>;
                  creationAndExpirationDateController
                    ..text = '${data.first} $until '
                        '${data.last}'
                    ..object = data;
                }
              },
            ),
            const SizedBox.shrink().paddingL(),
            SelectableItemFormButton(
              title: context.l10n.contactInfo,
              textController: contactInfoController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return context.l10n.fillingThisFieldIsRequired;
                } else {
                  return null;
                }
              },
              onClick: () async {
                final result = await context
                    .pushNamed(RouteNames.advertisementContactInfo);
                if (result != null) {
                  contactInfoController.text = result as String? ?? '';
                }
              },
            ),
            const SizedBox.shrink().paddingL(),
            TextFormField(
              controller: descriptionController,
              style: Theme.of(context).textTheme.titleMedium,
              textInputAction: TextInputAction.done,
              minLines: 4,
              maxLines: 10,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if ((value?.trim().length ?? 0) < 3) {
                  return context.l10n.fillingThisFieldIsRequired;
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                labelText: context.l10n.description,
                labelStyle: Theme.of(context).textTheme.titleMedium,
                contentPadding: EdgeInsets.all(context.margingXS),
              ),
              inputFormatters: [
                if (context.isPersian)
                  TextFieldPersianFormatter()
                else
                  TextFieldEnglishFormatter(),
              ],
            ),
            const SizedBox.shrink().paddingL(),
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          if (formKey.currentState?.validate() ?? false) {
            formKey.currentState?.save();
            //get values of form
          }
        },
        child: MText(text: context.l10n.publish),
      ),
    );
  }
}
