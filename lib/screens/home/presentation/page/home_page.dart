import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/bloc/bloc.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
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
    return const _HomeView();
  }
}

class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  int offset = 0;
  int limit = 10;
  late final ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        offset += limit;
        context.read<HomeBloc>().add(
              HomeGetAllAdEvent(offset: offset, limit: limit),
            );
      }
    });
    super.initState();
  }

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
            if (state.status == StateStatus.success &&
                state.advertisements.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MText(
                      text: context.l10n.thereIsNoAdToShow,
                      textAlign: TextAlign.center,
                    ),
                    TextButton(
                      onPressed: () {
                        context.goNamed(RouteNames.createAdvertisement);
                      },
                      child: MText(
                        text: context.l10n.createAdvertisement,
                      ),
                    ),
                  ],
                ),
              );
            }
            final data = state.advertisements;
            return RefreshIndicator(
              onRefresh: () async {
                offset = 0;
                limit = 10;
                context.read<HomeBloc>().add(
                      HomeGetAllAdEvent(offset: offset, limit: limit),
                    );
              },
              child: state.status == StateStatus.loading &&
                      state.advertisements.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: data.length,
                      controller: _scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
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
