import 'package:flutter/material.dart';
import 'package:landa/core/widgets/searchable_list/searchable_list.dart';

class SeletedItemChipList extends StatefulWidget {
  const SeletedItemChipList({
    required this.selectedEntities,
    this.onDeleted,
    super.key,
  });

  final List<SearchableListEntity> selectedEntities;
  final Function(SearchableListEntity)? onDeleted;

  @override
  State<SeletedItemChipList> createState() => _SeletedItemChipListState();
}

class _SeletedItemChipListState extends State<SeletedItemChipList> {
  late List<SearchableListEntity> selectedEntities =
      List.from(widget.selectedEntities);

  late final scrollController = ScrollController();

  @override
  void initState() {
    scrollToEndOfList();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant SeletedItemChipList oldWidget) {
    if (oldWidget.selectedEntities.length != widget.selectedEntities.length) {
      selectedEntities = List.from(widget.selectedEntities);
      scrollToEndOfList();
    }
    super.didUpdateWidget(oldWidget);
  }

  void scrollToEndOfList() {
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
    return SingleChildScrollView(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: selectedEntities
            .map(
              (e) => SelectedItemChip(
                entity: e,
                onDeleted: () {
                  widget.onDeleted?.call(e);
                  setState(() {
                    selectedEntities.remove(e);
                  });
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
