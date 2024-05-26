import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/bloc/bloc.dart';
import 'package:landa/core/utils/utils.dart';
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
        title: MText(text: context.l10n.category),
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
              return switch (index) {
                0 => CategoryList(
                    categories: state.categoryData.categories,
                    onTap: (category) {
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
                  ),
                1 => SubCategoryList(
                    subCategories: subCategories,
                    onTap: (subCategory) {
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
                  ),
                2 => SubCategoryItemList(
                    subCategoryItems: subCategoryItems,
                    onTap: (subCategoryItem) {
                      GoRouter.of(context).pop(subCategoryItem);
                    },
                  ),
                _ => const SizedBox.shrink(),
              };
            },
          );
        },
      ),
    );
  }
}
