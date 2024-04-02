import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/bloc/bloc.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/di_service.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/home/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static GoRoute get route => GoRoute(
        path: RouteNames.home,
        name: RouteNames.home,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: HomePage(),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        getAllAdUsecase: locator.get(),
      )..add(
          const HomeGetAllAdEvent(offset: 0, limit: 10),
        ),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<NewVersionBloc, NewVersionState>(
          listener: (context, state) {
            if (state.isNewVersion) {
              showDialog(
                context: context,
                builder: (_) => const NewVersionPopup(),
              );
            }
          },
        ),
        BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state.status == StateStatus.error) {
              Toastification().show(
                context: context,
                type: ToastificationType.error,
                title: MText(text: context.l10n.error),
                description: MText(text: context.l10n.sthWentWrong),
              );
            }
          },
        ),
      ],
      child: MScaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            final data = state.advertisements;
            return RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 1));
              },
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (_, index) {
                  return AdvertisementItem(
                    advertisement: data[index],
                  );
                },
              ),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.goNamed(RouteNames.createAdvertisement);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
