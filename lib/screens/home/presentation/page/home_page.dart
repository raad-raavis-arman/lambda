import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/bloc/bloc.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/home/presentation/presentation.dart';
import 'package:landa/screens/shared/domain/advertisements/entities/entities.dart';
import 'package:landa/screens/shared/presentaion/widgets/widgets.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:toastification/toastification.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

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
          return SlideTransitionPage(
            child: const HomePage(),
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
  //
  final locationKey = GlobalKey();
  final searchBarKey = GlobalKey();
  //
  void showTutorialCoach() {
    final List<TargetFocus> targets = [
      TargetFocus(
        keyTarget: locationKey,
        contents: [
          TargetContent(
            builder: (context, controller) {
              return CoachMarkDesc(
                next: context.l10n.next,
                skip: context.l10n.skip,
                text: context.l10n.locationFilterCoachDesc,
                onNext: () {
                  controller.next();
                },
                onSkip: () {
                  controller.skip();
                },
              );
            },
          ),
        ],
      ),
      TargetFocus(
        keyTarget: searchBarKey,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            builder: (context, controller) {
              return CoachMarkDesc(
                next: context.l10n.next,
                skip: context.l10n.skip,
                text: context.l10n.searchBarCoachDesc,
                onNext: () {
                  controller.next();
                },
                onSkip: () {
                  controller.skip();
                },
              );
            },
          ),
        ],
      ),
    ];
    TutorialCoachMark(
      targets: targets,
      textSkip: context.l10n.skip,
    ).show(context: context);
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then(
      (_) {
        showTutorialCoach();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String querySearch = '';
    int offset = 0;
    int limit = 10;
    final List<City> selectedCities = [];
    final searchDebouncer = SearchDebouncer(milliseconds: 300);

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
          centerTitle: true,
          title: SearchBarWidget(
            key: searchBarKey,
            onSubmitSearch: (query) {
              if (query == querySearch) {
                return;
              } else {
                searchDebouncer.run(
                  () {
                    offset = 0;
                    querySearch = query;
                    context.read<HomeBloc>().add(
                          HomeGetAllAdEvent(
                            query: query,
                            offset: offset,
                          ),
                        );
                  },
                );
              }
            },
          ),
          actions: [
            FilterLocationWidget(
              key: locationKey,
              onFilteredLocation: (filteredCities) {
                selectedCities
                  ..clear()
                  ..addAll(filteredCities);

                offset = 0;
                context.read<HomeBloc>().add(
                      HomeGetAllAdEvent(
                        cityIds: selectedCities.map((e) => e.id).toList(),
                        query: querySearch,
                        offset: offset,
                      ),
                    );
              },
            ),
          ],
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) {
            return previous.status != current.status;
          },
          builder: (context, state) {
            if (state.advertisements.isEmpty) {
              if (state.status == StateStatus.success) {
                return const NoAdvertisementWidget();
              } else if (state.status == StateStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.status == StateStatus.error) {
                return LoadDataFailed(
                  tryAgain: () {
                    searchDebouncer.run(
                      () {
                        offset = 0;
                        context.read<HomeBloc>().add(
                              HomeGetAllAdEvent(
                                cityIds:
                                    selectedCities.map((e) => e.id).toList(),
                                query: querySearch,
                                offset: offset,
                              ),
                            );
                      },
                    );
                  },
                );
              } else {
                return const SizedBox.shrink();
              }
            } else {
              final data = state.advertisements;
              return AdvertisementListWidget(
                data: data,
                onScrollReachedEnd: () {
                  offset += limit;
                  context.read<HomeBloc>().add(
                        HomeGetAllAdEvent(offset: offset, limit: limit),
                      );
                },
                onRefresh: () async {
                  offset = 0;
                  limit = 10;
                  final getEventsCompleter = Completer();
                  context.read<HomeBloc>().add(
                        HomeGetAllAdEvent(offset: offset, limit: limit),
                      );
                  context.read<HomeBloc>().stream.listen((state) {
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
      ),
    );
  }
}
