import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

  final categoryController = TextController();
  final advertisementAreaController = TextController();
  final priceController = TextController();
  final creationAndExpirationDateController = TextController();
  final contactInfoController = TextController();

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
              style: Theme.of(context).textTheme.titleMedium,
              validator: (value) {
                if ((value?.trim().length ?? 0) < 3) {
                  return '';
                } else {
                  return null;
                }
              },
              onSaved: (newValue) {},
              decoration: InputDecoration(
                labelText: context.l10n.caption,
                labelStyle: Theme.of(context).textTheme.titleMedium,
                contentPadding: const EdgeInsets.symmetric(horizontal: 6),
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
            SelectableItemFormButton(
              title: context.l10n.advertisementArea,
              textController: advertisementAreaController,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return '';
                } else {
                  return null;
                }
              },
              onSaved: (newValue) {},
              onClick: () async {
                final data =
                    await context.pushNamed(RouteNames.advertisementArea);
                if (data != null) {
                  final city = data as City;
                  advertisementAreaController.value =
                      '${city.provinceName}/${city.cityName}';
                }
              },
            ),
            const SizedBox.shrink().paddingL(),
            SelectableItemFormButton(
              title: context.l10n.price,
              textController: priceController,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return '';
                } else {
                  return null;
                }
              },
              onSaved: (newValue) {},
              onClick: () {
                context.pushNamed(RouteNames.advertisementPrice).then((data) {
                  if (data != null) {
                    priceController.value = context.l10n.tmn(data as String);
                  }
                });
              },
            ),
            const SizedBox.shrink().paddingL(),
            TextFormField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: Theme.of(context).textTheme.titleMedium,
              validator: (value) {
                if (value?.trim().isEmpty ?? true) {
                  return '';
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
                contentPadding: const EdgeInsets.symmetric(horizontal: 6),
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
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return '';
                } else {
                  return null;
                }
              },
              onSaved: (newValue) {},
              onClick: () async {
                final result =
                    await context.pushNamed(RouteNames.advertisementDate);
                if (result != null) {
                  creationAndExpirationDateController.value = result as String?;
                }
              },
            ),
            const SizedBox.shrink().paddingL(),
            SelectableItemFormButton(
              title: context.l10n.contactInfo,
              textController: contactInfoController,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return '';
                } else {
                  return null;
                }
              },
              onSaved: (newValue) {},
              onClick: () async {
                final result = await context
                    .pushNamed(RouteNames.advertisementContactInfo);
                if (result != null) {
                  contactInfoController.value = result as String?;
                }
              },
            ),
            const SizedBox.shrink().paddingL(),
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
