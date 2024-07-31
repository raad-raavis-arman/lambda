import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/bloc/state_status.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/di_service.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/marked_advertisements/presentation/bloc/marked_advertisements_bloc.dart';
import 'package:landa/screens/marked_advertisements/presentation/widgets/widgets.dart';
import 'package:landa/screens/shared/presentaion/widgets/advertisement_list_widget.dart';

class MarkedAdvertisementsPage extends StatelessWidget {
  const MarkedAdvertisementsPage({super.key});

  static GoRoute get route => GoRoute(
        path: RouteNames.markedAdvertisements,
        name: RouteNames.markedAdvertisements,
        pageBuilder: (context, state) {
          return SlideTransitionPage(
            child: const MarkedAdvertisementsPage(),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MarkedAdvertisementsBloc(
        locator.get(),
      )..add(
          GetAllMarkedAdvertisementsEvent(),
        ),
      child: const _MarkedAdvertisementsPageView(),
    );
  }
}

class _MarkedAdvertisementsPageView extends StatelessWidget {
  const _MarkedAdvertisementsPageView();

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: MText(text: context.l10n.bookmarkedAdvertisements),
      ),
      body: BlocBuilder<MarkedAdvertisementsBloc, MarkedAdvertisementsState>(
        buildWhen: (previous, current) {
          return previous.status != current.status;
        },
        builder: (context, state) {
          if (state.status == StateStatus.success && state.data.isEmpty) {
            return const NoMarkedAdvertisementWidget();
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
                context.read<MarkedAdvertisementsBloc>().add(
                      GetAllMarkedAdvertisementsEvent(),
                    );
                context.read<MarkedAdvertisementsBloc>().stream.listen((state) {
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
