import 'dart:async';

import 'package:flutter/material.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/l10n/l10n.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchAnchor.bar(
      barElevation: const WidgetStatePropertyAll(0),
      barHintText: context.l10n.searchBarHint,
      barTextStyle: WidgetStatePropertyAll(
        Theme.of(context).textTheme.bodyMedium,
      ),
      viewHeaderTextStyle: Theme.of(context).textTheme.bodyMedium,
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
    return [];
  }
}
