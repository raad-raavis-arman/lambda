import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/bloc/bloc.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/home/presentation/presentation.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:toastification/toastification.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static GoRoute get route => GoRoute(
        path: RouteNames.home,
        name: RouteNames.home,
        pageBuilder: (context, state) {
          if (kIsWeb) {
            // TODO(Taleb): do seo for all routes with keywords
            MetaSEO()
              ..ogTitle(ogTitle: 'home screen')
              ..description(description: 'all advertisements')
              ..keywords(
                keywords: 'تخفیف',
              );
          }
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
  String querySearch = '';
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
        appBar: AppBar(
          title: SearchBarWidget(
            onSubmitSearch: onSubmitSearch,
          ),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) {
            return previous.status != current.status;
          },
          builder: (context, state) {
            if (state.status == StateStatus.success &&
                state.advertisements.isEmpty) {
              return const NoAdvertisementWidget();
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
      ),
    );
  }

  void onSubmitSearch(String query) {
    if (query == querySearch) {
      return;
    } else {
      offset = 0;
      querySearch = query;
      context.read<HomeBloc>().add(
            HomeGetAllAdEvent(query: query),
          );
    }
  }
}
