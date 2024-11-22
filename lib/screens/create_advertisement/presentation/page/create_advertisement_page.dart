import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/controllers/controllers.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/di_service.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/advertisement_area/domain/entities/entities.dart';
import 'package:landa/screens/advertisement_category/domain/entities/entities.dart';
import 'package:landa/screens/advertisement_date/presentation/widgets/widgets.dart';
import 'package:landa/screens/create_advertisement/domain/usecases/creaet_advertisement_usecase.dart';
import 'package:landa/screens/create_advertisement/presentation/presentation.dart';
import 'package:landa/screens/home/presentation/presentation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';

class CreateAdvertisementPage extends StatelessWidget {
  const CreateAdvertisementPage({super.key});

  static GoRoute get route => GoRoute(
        path: RouteNames.createAdvertisement,
        name: RouteNames.createAdvertisement,
        pageBuilder: (context, state) {
          return SlideTransitionPage(
            child: const CreateAdvertisementPage(),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateAdvertisementBloc(
        createAdvertisementUsescase: locator.get(),
      ),
      child: const _CreateAdvertisementView(),
    );
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
  final descriptionController = MTextEditingController();
  final productCountController = MTextEditingController();

  late final until = context.l10n.until;

  @override
  void initState() {
    final user = locator.get<SharedPreferences>().getUser();
    contactInfoController
      ..text = user?.mobileNumber ?? ''
      ..object = [
        user?.mobileNumber ?? '',
        'true',
      ];
    super.initState();
  }

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
    final l10n = context.l10n;
    return MScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: MText(text: l10n.newAdvertisement),
        leading: BackButton(
          onPressed: () {
            context.goNamed(RouteNames.dashboard);
          },
        ),
      ),
      scrollable: true,
      body: Form(
        key: formKey,
        child: Column(
          children: [
            SelectableItemFormButton(
              title: l10n.category,
              textController: categoryController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return l10n.fillingThisFieldIsRequired;
                } else {
                  return null;
                }
              },
              onClick: () async {
                final data = await context.pushNamed(RouteNames.category);
                if (data != null && data is SubCategoryItem) {
                  categoryController
                    ..text = data.nameFa
                    ..object = data;
                }
              },
            ),
            const SizedBox.shrink().paddingL(),
            SelectableItemFormButton(
              title: l10n.advertisementArea,
              textController: advertisementAreaController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return l10n.fillingThisFieldIsRequired;
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
                    ..text = '${city.provinceName}/${city.name}'
                    ..object = city;
                }
              },
            ),
            const SizedBox.shrink().paddingL(),
            SelectableItemFormButton(
              title: l10n.price,
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
                  if (data != null && data is List<String>) {
                    final finalPrice = data.last;
                    priceController
                      ..text = l10n.tmn(finalPrice)
                      ..object = data;
                  }
                });
              },
            ),
            const SizedBox.shrink().paddingL(),
            TextFormField(
              controller: productCountController,
              textAlign: TextAlign.center,
              keyboardType: const TextInputType.numberWithOptions(
                signed: true,
              ),
              textInputAction: TextInputAction.done,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: Theme.of(context).textTheme.bodyMedium,
              validator: (value) {
                if (value?.trim().isEmpty ?? true) {
                  return l10n.fillingThisFieldIsRequired;
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
                contentPadding: EdgeInsets.all(context.marginXS),
                suffix: MText(
                  text: l10n.number,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                labelText: context.l10n.productCount,
                labelStyle: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox.shrink().paddingL(),
            SelectableItemFormButton(
              title: l10n.creationAndExpirationDate,
              textController: creationAndExpirationDateController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return l10n.fillingThisFieldIsRequired;
                } else {
                  return null;
                }
              },
              onClick: () async {
                final result = await context.pushNamed(
                  RouteNames.advertisementDate,
                  extra: creationAndExpirationDateController.object,
                );
                if (result != null) {
                  final List<MDatePickerValue> data =
                      result as List<MDatePickerValue>;
                  creationAndExpirationDateController
                    ..text = '${data.first} $until '
                        '${data.last}'
                    ..object = data;
                }
              },
            ),
            const SizedBox.shrink().paddingL(),
            SelectableItemFormButton(
              title: l10n.contactInfo,
              textController: contactInfoController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return l10n.fillingThisFieldIsRequired;
                } else {
                  return null;
                }
              },
              onClick: () async {
                final result = await context.pushNamed(
                  RouteNames.advertisementContactInfo,
                  extra: contactInfoController.object,
                );
                if (result != null && result is List<String>) {
                  contactInfoController
                    ..text = result.first
                    ..object = result;
                }
              },
            ),
            const SizedBox.shrink().paddingL(),
            TextFormField(
              controller: descriptionController,
              style: Theme.of(context).textTheme.bodyMedium,
              textInputAction: TextInputAction.newline,
              keyboardType: TextInputType.multiline,
              minLines: 4,
              maxLines: 10,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                labelText: context.l10n.description,
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                contentPadding: EdgeInsets.symmetric(
                  vertical: context.marginM,
                  horizontal: context.marginXS,
                ),
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
      bottomNavigationBar:
          BlocConsumer<CreateAdvertisementBloc, CreateAdvertisementState>(
        listener: (context, state) {
          if (state is CreateAdvertisementErrorState) {
            Toastification().show(
              context: context,
              type: ToastificationType.error,
              title: MText(text: l10n.error),
              description: MText(text: l10n.sthWentWrong),
            );
          } else if (state is CreateAdvertisementSuccessState) {
            Toastification().show(
              context: context,
              type: ToastificationType.success,
              title: MText(text: context.l10n.success),
              description: MText(text: context.l10n.advertisementUploadSuccess),
            );
            context.read<HomeBloc>().add(const HomeGetAllAdEvent());
            context.replaceNamed(RouteNames.dashboard);
          }
        },
        builder: (context, state) {
          return ElevatedButton(
            onPressed: state is CreateAdvertisementLoadingState
                ? null
                : () {
                    if (formKey.currentState?.validate() ?? false) {
                      formKey.currentState?.save();
                      final productCreateAndExpirationDateTime =
                          creationAndExpirationDateController.object
                              as List<MDatePickerValue>;
                      final productCreateDateTime =
                          productCreateAndExpirationDateTime.first
                              .toUtcDateTime();
                      final productExpirationDateTime =
                          productCreateAndExpirationDateTime.last
                              .toUtcDateTime();
                      //
                      final priceData = priceController.object as List<String>;
                      final origianlPrice =
                          priceData[0].replaceFaNumToEn().parseDouble();
                      final discount =
                          priceData[1].replaceFaNumToEn().parseDouble();
                      final discountedPrice =
                          priceData[2].replaceFaNumToEn().parseDouble();
                      //
                      final subCategoryItem =
                          categoryController.object as SubCategoryItem;
                      //
                      final city = advertisementAreaController.object as City;
                      //
                      final contactInfo =
                          contactInfoController.object as List<String>;
                      final mobileNumber = contactInfo[0].replaceFaNumToEn();
                      final showContactInfo = !bool.parse(contactInfo[1]);
                      //
                      final param = CreateAdvertisementParam(
                        description: descriptionController.text,
                        pExpireDateTime: productExpirationDateTime,
                        pCreateDateTime: productCreateDateTime,
                        count: int.parse(
                          productCountController.text
                              .replaceFaNumToEn()
                              .replaceAll(',', ''),
                        ),
                        originalPrice: origianlPrice,
                        discountedPrice: discountedPrice,
                        discount: discount,
                        categoryId: subCategoryItem.categoryId,
                        subCategoryId: subCategoryItem.subCategoryId,
                        subCategoryItemId: subCategoryItem.id,
                        provinceId: city.provinceId,
                        cityId: city.id,
                        contactNumber: mobileNumber,
                        showContactInfo: showContactInfo,
                      );

                      context.read<CreateAdvertisementBloc>().add(
                            CreateAdvertisementEvent(param: param),
                          );
                    }
                  },
            child: state is CreateAdvertisementLoadingState
                ? const CircularProgressIndicator()
                : MText(text: context.l10n.publish),
          );
        },
      ),
    );
  }
}
