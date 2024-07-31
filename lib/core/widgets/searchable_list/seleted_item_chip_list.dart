import 'package:flutter/material.dart';
import 'package:landa/core/widgets/searchable_list/searchable_list.dart';

class SeletedItemChipList extends StatelessWidget {
  const SeletedItemChipList({
    required this.selectedEntities,
    this.onDeleted,
    super.key,
  });

  final List<SearchableListEntity> selectedEntities;
  final Function(SearchableListEntity)? onDeleted;

  void scrollToEndOfList(ScrollController scrollController) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    scrollToEndOfList(scrollController);
    return SingleChildScrollView(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: selectedEntities
            .map(
              (e) => SelectedItemChip(
                title: e.title,
                onDeleted: () {
                  onDeleted?.call(e);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
