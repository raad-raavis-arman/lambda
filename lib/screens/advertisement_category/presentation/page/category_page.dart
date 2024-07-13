import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/bloc/bloc.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/searchable_list/searchable_list.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/advertisement_category/domain/entities/entities.dart';
import 'package:landa/screens/advertisement_category/presentation/presentation.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({
    super.key,
    this.isSelect = true,
  });

  final bool isSelect;

  static GoRoute get route => GoRoute(
        path: RouteNames.category,
        name: RouteNames.category,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: CategoryPage(),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return _CategoryView(
      isSelect: isSelect,
    );
  }
}

class _CategoryView extends StatefulWidget {
  const _CategoryView({this.isSelect = true});

  final bool isSelect;

  @override
  State<_CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<_CategoryView> {
  List<SubCategory> subCategories = [];
  List<SubCategoryItem> subCategoryItems = [];
  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: MText(text: context.l10n.category),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, kToolbarHeight),
          child: SuggestCategoryWidget(
            onButtonPressed: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(
                      context.radiusS,
                    ),
                    topLeft: Radius.circular(
                      context.radiusS,
                    ),
                  ),
                ),
                builder: (_) => const SuggestNewCategoryPopup(),
              );
            },
          ),
        ),
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (_, state) {
          if (state.status == StateStatus.loading &&
              state.categoryData.categories.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == StateStatus.error &&
              state.categoryData.categories.isEmpty) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<CategoryBloc>().add(GetCategoriesEvent());
                },
                child: MText(text: context.l10n.tryAgain),
              ),
            );
          }
          return PageView.builder(
            controller: pageController,
            itemCount: 3,
            itemBuilder: (_, index) {
              switch (index) {
                case 0:
                  final categories = state.categoryData.categories;
                  final data = categories
                      .map(
                        (e) => SearchableListEntity(
                          title: e.nameFa,
                          iconUrl: '$iconBaseUrl${e.iconName}',
                        ),
                      )
                      .toList();
                  return SearchableListWidget(
                    data: data,
                    onTap: (index) {
                      final category = categories[index];
                      subCategories = state.categoryData.subCategories
                          .where(
                            (element) => element.categoryId == category.id,
                          )
                          .toList();
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                    },
                  );
                case 1:
                  final data = subCategories
                      .map(
                        (e) => SearchableListEntity(
                          title: e.nameFa,
                          iconUrl: '$iconBaseUrl${e.iconName}',
                        ),
                      )
                      .toList();
                  return SearchableListWidget(
                    data: data,
                    onTap: (index) {
                      final subCategory = subCategories[index];
                      subCategoryItems = state.categoryData.subCategoryItems
                          .where(
                            (element) =>
                                element.subCategoryId == subCategory.id,
                          )
                          .toList();
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                    },
                  );

                case 2:
                  final data = subCategoryItems
                      .map(
                        (e) => SearchableListEntity(
                          title: e.nameFa,
                          iconUrl: '$iconBaseUrl${e.iconName}',
                          showTrailingArrow: false,
                        ),
                      )
                      .toList();
                  return SearchableListWidget(
                    data: data,
                    onTap: (index) {
                      final subCategoryItem = subCategoryItems[index];
                      GoRouter.of(context).pop(subCategoryItem);
                    },
                  );
                default:
                  return const SizedBox.shrink();
              }
            },
          );
        },
      ),
    );
  }
}
