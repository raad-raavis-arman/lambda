import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/di_service.dart';
import 'package:landa/screens/advertisement_category/domain/entities/entities.dart';
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
  _CategoryView({this.isSelect = true});

  final bool isSelect;

  final mData = {
    const Category(id: 1, title: 'دسته بندی ۱', productType: 0): const [
      SubCategory(id: 1, categoryId: 1, title: 'ساب کتگوری ۱'),
      SubCategory(id: 2, categoryId: 1, title: 'ساب کتگوری ۲'),
      SubCategory(id: 3, categoryId: 1, title: 'ساب کتگوری ۳'),
      SubCategory(id: 4, categoryId: 1, title: 'ساب کتگوری ۴'),
    ],
    const Category(id: 2, title: 'دسته بندی ۲', productType: 0): const [
      SubCategory(id: 1, categoryId: 2, title: 'ساب کتگوری ۱'),
      SubCategory(id: 2, categoryId: 2, title: 'ساب کتگوری ۲'),
      SubCategory(id: 3, categoryId: 2, title: 'ساب کتگوری ۳'),
      SubCategory(id: 4, categoryId: 2, title: 'ساب کتگوری ۴'),
    ],
    const Category(id: 3, title: 'دسته بندی ۳', productType: 0): const [
      SubCategory(id: 1, categoryId: 3, title: 'ساب کتگوری ۱'),
      SubCategory(id: 2, categoryId: 3, title: 'ساب کتگوری ۲'),
      SubCategory(id: 3, categoryId: 3, title: 'ساب کتگوری ۳'),
      SubCategory(id: 4, categoryId: 3, title: 'ساب کتگوری ۴'),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      body: ListView.builder(
        itemCount: mData.length,
        itemBuilder: (context, index) {
          final category = mData.entries.toList()[index].key;
          final subCategories = mData.entries.toList()[index].value;
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
                    context.pop([category,subCategories[index]]);
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
