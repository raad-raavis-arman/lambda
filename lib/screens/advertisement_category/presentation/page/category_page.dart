import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/bloc/bloc.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/di_service.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/advertisement_category/presentation/bloc/bloc.dart';

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
    return BlocProvider(
      create: (_) => CategoryBloc(
        getCategoriesUsescase: locator.get(),
        suggestCategoryUsescase: locator.get(),
        suggestSubCategoryUsescase: locator.get(),
      )..add(GetCategoriesEvent()),
      child: _CategoryView(
        isSelect: isSelect,
      ),
    );
  }
}

class _CategoryView extends StatelessWidget {
  const _CategoryView({this.isSelect = true});

  final bool isSelect;

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state.status == StateStatus.loading &&
              state.categories.entries.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == StateStatus.error &&
              state.categories.entries.isEmpty) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<CategoryBloc>().add(GetCategoriesEvent());
                },
                child: MText(text: context.l10n.tryAgain),
              ),
            );
          }
          final categories = state.categories.keys.toList();
          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              final subCategories = state.categories[category] ?? [];
              return ExpansionTile(
                title: MText(
                  text: category.title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                children: List.generate(
                  subCategories.length,
                  (index) => InkWell(
                    child: SizedBox(
                      width: double.infinity,
                      child: MText(
                        text: subCategories[index].title,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ).paddingS(),
                    ),
                    onTap: () {
                      if (isSelect) {
                        context.pop([category, subCategories[index]]);
                      }
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
