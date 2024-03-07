import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/di_service.dart';
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
        getSubCategoriesUsescase: locator.get(),
        suggestCategoryUsescase: locator.get(),
        suggestSubCategoryUsescase: locator.get(),
      ),
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
      body: ListView.builder(
        itemBuilder: (context, index) => ExpansionTile(
          title: const MText(
            text: 'text kjhkhkhkj',
          ),
          children: List.generate(
            4,
            (index) => MText(text: 'Sddfd $index'),
          ),
        ),
      ),
    );
  }
}
