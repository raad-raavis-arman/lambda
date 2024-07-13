import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/home/presentation/presentation.dart';

class SearchBarWidget extends StatelessWidget {
  SearchBarWidget({
    required this.onSubmitSearch,
    super.key,
  });

  final Function(String) onSubmitSearch;
  final allCategories = <String>[];

  List<String> getAllCategories(BuildContext context) {
    final categoryData = context.read<HomeBloc>().state.categoryData;
    if (categoryData.subCategoryItems.isEmpty) {
      context.read<HomeBloc>().add(HomeGetAllCategoriesEvent());
      return [];
    } else {
      final subCategoryItems =
          categoryData.subCategoryItems.map((e) => e.nameFa);
      final subCategories = categoryData.subCategories.map((e) => e.nameFa);
      final categories = categoryData.categories.map((e) => e.nameFa);
      return [
        ...subCategoryItems,
        ...subCategories,
        ...categories,
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    allCategories.addAll(getAllCategories(context));
    final searchController = SearchController();
    return SearchAnchor.bar(
      onSubmitted: (value) {
        onSubmitSearch.call(value);
        if (searchController.isOpen) {
          searchController.closeView(value);
        }
      },
      searchController: searchController,
      barElevation: const WidgetStatePropertyAll(0),
      barHintText: context.l10n.searchBarHint,
      barTextStyle: WidgetStatePropertyAll(
        Theme.of(context).textTheme.bodyLarge,
      ),
      viewTrailing: [
        IconButton(
          icon: const Icon(Icons.close),
          tooltip: MaterialLocalizations.of(context).clearButtonTooltip,
          onPressed: () {
            searchController.clear();
            onSubmitSearch.call('');
          },
        ),
      ],
      onChanged: (value) {
        if (value.isEmpty) {
          onSubmitSearch.call('');
        }
      },
      isFullScreen: true,
      textInputAction: TextInputAction.search,
      viewHeaderTextStyle: Theme.of(context).textTheme.bodyLarge,
      viewShape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).indicatorColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(context.radiusS),
        ),
      ),
      barShape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).indicatorColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(context.radiusS),
          ),
        ),
      ),
      suggestionsBuilder: suggestionsBuilder,
    );
  }

  FutureOr<Iterable<Widget>> suggestionsBuilder(
    BuildContext context,
    SearchController searchController,
  ) async {
    if (allCategories.isEmpty) {
      allCategories.addAll(getAllCategories(context));
    }
    if (allCategories.isEmpty) {
      return [];
    }
    final suggestionList = allCategories.where(
      (e) => e.contains(
        searchController.text,
      ),
    );
    if (suggestionList.isEmpty) {
      return [];
    }
    return suggestionList
        .map(
          (e) => InkWell(
            onTap: () {
              if (searchController.isOpen) {
                searchController.closeView(e);
              }

              onSubmitSearch.call(e);
            },
            child: MText(
              text: e,
              style: Theme.of(context).textTheme.labelMedium,
            ).paddingS(),
          ),
        )
        .toList();
  }
}
