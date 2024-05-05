import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';
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
            final data = state.data;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final province = data.entries.toList()[index].key;
                final cities = data.entries.toList()[index].value;
                return ExpansionTile(
                  title: MText(
                    text: province.name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  children: List.generate(
                    cities.length,
                    (index) => InkWell(
                      child: SizedBox(
                        width: double.infinity,
                        child: MText(
                          text: cities[index].name,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ).paddingS(),
                      ),
                      onTap: () {
                        context.pop(cities[index]);
                      },
                    ),
                  ),
                );
              },
            );
          } else if (state is AdvertisementAreaLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AdvertisementAreaErrorState) {
            return const Center(
              child: MText(text: 'خطایی رخ داده است'),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
