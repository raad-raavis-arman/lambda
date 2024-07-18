import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/bloc/state_status.dart';
import 'package:landa/core/utils/router/router.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/di_service.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/my_advertisements/presentation/bloc/bloc.dart';
import 'package:landa/screens/my_advertisements/presentation/widgets/widgets.dart';
import 'package:landa/screens/shared/presentaion/widgets/advertisement_list_widget.dart';

class MyAdvertisementsPage extends StatelessWidget {
  const MyAdvertisementsPage({super.key});

  static GoRoute get route => GoRoute(
        path: RouteNames.myAdvertisements,
        name: RouteNames.myAdvertisements,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: MyAdvertisementsPage(),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyAdvertisementsBloc(
        locator.get(),
      )..add(
          GetMyAdvertisementsEvent(),
        ),
      child: const _MyAdvertisementsPageView(),
    );
  }
}

class _MyAdvertisementsPageView extends StatelessWidget {
  const _MyAdvertisementsPageView();

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: MText(text: context.l10n.myAdvertisements),
      ),
      body: BlocBuilder<MyAdvertisementsBloc, MyAdvertisementsState>(
        buildWhen: (previous, current) {
          return previous.status != current.status;
        },
        builder: (context, state) {
          if (state.status == StateStatus.success && state.data.isEmpty) {
            return const NoAdvertisementByMeWidget();
          } else if (state.status == StateStatus.loading &&
              state.data.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final data = state.data;
            return AdvertisementListWidget(
              data: data,
              onRefresh: () async {
                final getEventsCompleter = Completer();
                context.read<MyAdvertisementsBloc>().add(
                      GetMyAdvertisementsEvent(),
                    );
                context.read<MyAdvertisementsBloc>().stream.listen((state) {
                  if (state.status != StateStatus.loading &&
                      state.status != StateStatus.initial) {
                    getEventsCompleter.complete();
                  }
                });
                return getEventsCompleter.future;
              },
            );
          }
        },
      ),
    );
  }
}
