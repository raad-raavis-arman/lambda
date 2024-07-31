import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/bloc/state_status.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/searchable_list/searchable_list_entity.dart';
import 'package:landa/core/widgets/searchable_list/searchable_list_widget.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/advertisement_area/domain/entities/entities.dart';
import 'package:landa/screens/advertisement_area/presentation/bloc/bloc.dart';
import 'package:landa/screens/shared/presentaion/widgets/widgets.dart';

class AdvertisementAreaPage extends StatelessWidget {
  const AdvertisementAreaPage({
    super.key,
    this.isMultipleSelect = false,
    this.selectedCities,
  });

  final bool isMultipleSelect;
  final List<City>? selectedCities;

  static GoRoute get route => GoRoute(
        path: RouteNames.advertisementArea,
        name: RouteNames.advertisementArea,
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return SlideTransitionPage(
            child: AdvertisementAreaPage(
              isMultipleSelect: extra?['isMultipleSelect'] ?? false,
              selectedCities: extra?['selectedCities'],
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return _AdvertisementAreaView(
      isMultipleSelect: isMultipleSelect,
      selectedCityList: selectedCities,
    );
  }
}

class _AdvertisementAreaView extends StatefulWidget {
  const _AdvertisementAreaView({
    required this.isMultipleSelect,
    required this.selectedCityList,
  });

  final bool isMultipleSelect;
  final List<City>? selectedCityList;

  @override
  State<_AdvertisementAreaView> createState() => _AdvertisementAreaViewState();
}

class _AdvertisementAreaViewState extends State<_AdvertisementAreaView> {
  List<SearchableListEntity>? selectedCities;

  @override
  void initState() {
    if (widget.selectedCityList != null) {
      selectedCities = List.from(
        widget.selectedCityList!.map(
          (e) => SearchableListEntity(title: e.name, value: e),
        ),
      );
    }
    super.initState();
  }

  final pageController = PageController(keepPage: false);
  Province? selectedProvince;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: MText(text: context.l10n.advertisementArea),
        leading: BackButton(
          onPressed: () {
            if ((pageController.page?.round() ?? 0) > 0) {
              selectedIndex = 0;
              pageController.previousPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear,
              );
            } else {
              context.pop();
            }
          },
        ),
      ),
      body: BlocBuilder<AdvertisementAreaBloc, AdvertisementAreaState>(
        builder: (context, state) {
          if (state.status == StateStatus.success || state.data.isNotEmpty) {
            final data = state.data;
            final provinces = data.keys.toList();
            return PageView.builder(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              onPageChanged: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    final data = provinces
                        .map(
                          (e) => SearchableListEntity(
                            title: e.name,
                            value: e,
                          ),
                        )
                        .toList();
                    return SearchableListWidget(
                      data: data,
                      selectedEntities: selectedCities,
                      onCancel: () {
                        context.pop();
                      },
                      onSelection: (selectedItems) {
                        selectedCities = List.from(selectedItems);
                      },
                      onConfirm: (selectedItems) {
                        context.pop(
                          selectedItems.map((e) => e.value as City).toList(),
                        );
                      },
                      onTap: (item) async {
                        selectedProvince = item.value as Province;
                        await pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      },
                    );
                  case 1:
                    final data = (state.data[selectedProvince!] ?? [])
                        .map(
                          (e) => SearchableListEntity(
                            title: e.name,
                            value: e,
                            showTrailingArrow: false,
                          ),
                        )
                        .toList();
                    return SearchableListWidget(
                      key: ValueKey(selectedIndex),
                      data: data,
                      selectAllTitle:
                          context.l10n.allCitiesOf(selectedProvince!.name),
                      selectedEntities: selectedCities,
                      isMultipleSelect: widget.isMultipleSelect,
                      onCancel: () {
                        context.pop();
                      },
                      onConfirm: (selectedItems) {
                        context.pop(
                          selectedItems.map((e) => e.value as City).toList(),
                        );
                      },
                      onSelection: (selectedItems) {
                        selectedCities = List.from(selectedItems);
                      },
                      onTap: (item) {
                        final city = item.value as City;
                        context.pop(city);
                      },
                    );
                  default:
                    return const SizedBox.shrink();
                }
              },
            );
          } else if (state.status == StateStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == StateStatus.error) {
            return LoadDataFailed(
              tryAgain: () {
                context
                    .read<AdvertisementAreaBloc>()
                    .add(AdvertisementAreaInitialEvent());
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
