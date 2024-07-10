import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/searchable_list/searchable_list_entity.dart';
import 'package:landa/core/widgets/searchable_list/searchable_list_widget.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/advertisement_area/domain/entities/entities.dart';
import 'package:landa/screens/advertisement_area/presentation/bloc/bloc.dart';

class AdvertisementAreaPage extends StatelessWidget {
  const AdvertisementAreaPage({super.key});

  static GoRoute get route => GoRoute(
        path: RouteNames.advertisementArea,
        name: RouteNames.advertisementArea,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: AdvertisementAreaPage(),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return const _AdvertisementAreaView();
  }
}

class _AdvertisementAreaView extends StatelessWidget {
  const _AdvertisementAreaView();

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: AppBar(
        title: MText(text: context.l10n.advertisementArea),
      ),
      body: BlocBuilder<AdvertisementAreaBloc, AdvertisementAreaState>(
        builder: (context, state) {
          if (state is AdvertisementAreaDataState) {
            final pageController = PageController();
            final data = state.data;
            final provinces = data.keys.toList();
            List<City> allCities = [];
            return PageView.builder(
              controller: pageController,
              itemCount: 2,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    final data = provinces
                        .map(
                          (e) => SearchableListEntity(
                            title: e.name,
                          ),
                        )
                        .toList();
                    return SearchableListWidget(
                      data: data,
                      onTap: (index) {
                        final province = provinces[index];
                        allCities = state.data[province] ?? [];
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      },
                    );
                  case 1:
                    final data = allCities
                        .map(
                          (e) => SearchableListEntity(
                            title: e.name,
                            showTrailingArrow: false,
                          ),
                        )
                        .toList();
                    return SearchableListWidget(
                      data: data,
                      onTap: (index) {
                        final city = allCities[index];
                        context.pop(city);
                      },
                    );
                  default:
                    return const SizedBox.shrink();
                }
              },
            );
          } else if (state is AdvertisementAreaLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AdvertisementAreaErrorState) {
            return Center(
              child: MText(
                text: context.l10n.loadingDataFailed,
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
