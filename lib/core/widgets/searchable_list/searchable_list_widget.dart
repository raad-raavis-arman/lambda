import 'package:flutter/material.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/searchable_list/searchable_list.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';

class SearchableListWidget extends StatefulWidget {
  const SearchableListWidget({
    required this.data,
    this.selectAllTitle,
    this.onSelection,
    this.isMultipleSelect = false,
    this.selectedEntities,
    this.onTap,
    this.onCancel,
    this.onConfirm,
    super.key,
  });

  final String? selectAllTitle;
  final List<SearchableListEntity> data;
  //onSelection will trigger by the list of selected
  //items when user select or unselect an item
  final void Function(List<SearchableListEntity>)? onSelection;
  final void Function(SearchableListEntity)? onTap;
  final bool isMultipleSelect;

  final Function(List<SearchableListEntity>)? onConfirm;
  final VoidCallback? onCancel;
  final List<SearchableListEntity>? selectedEntities;

  @override
  State<SearchableListWidget> createState() => _SearchableListWidgetState();
}

class _SearchableListWidgetState extends State<SearchableListWidget> {
  late List<SearchableListEntity> filteredData;
  late final Set<SearchableListEntity> selectedEntities;
  String searchedQuery = '';
  late final TextEditingController searchController;

  @override
  void initState() {
    filteredData = List.from(widget.data);
    selectedEntities =
        List<SearchableListEntity>.from(widget.selectedEntities ?? []).toSet();
    searchController = TextEditingController();
    searchedQuery = '';
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SearchableListWidget oldWidget) {
    if (oldWidget.data.length != widget.data.length) {
      filteredData = List.from(widget.data);
      searchedQuery = '';
      searchController.clear();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (selectedEntities.isNotEmpty)
          SeletedItemChipList(
            selectedEntities: List.from(selectedEntities),
            onDeleted: (item) {
              setState(() {
                selectedEntities.remove(item);
              });
              widget.onSelection?.call(selectedEntities.toList());
            },
          ),
        Expanded(
          child: filteredData.isEmpty
              ? Center(
                  child: MText(
                    text: context.l10n.thereIsNoData,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                )
              : Column(
                  children: [
                    if (widget.isMultipleSelect)
                      SearchableListItem(
                        title: widget.selectAllTitle ?? context.l10n.selectAll,
                        isSelected:
                            selectedEntities.length == widget.data.length,
                        isSelectable: true,
                        showTrailingArrow: false,
                        onSelect: () {
                          if (selectedEntities.length == widget.data.length) {
                            return;
                          }
                          for (var i = 0; i < widget.data.length; i++) {
                            selectedEntities.add(widget.data[i]);
                          }
                          setState(() {});
                          widget.onSelection?.call(
                            selectedEntities.toList(),
                          );
                        },
                        onUnSelect: () {
                          if (selectedEntities.isEmpty) {
                            return;
                          }
                          for (var i = 0; i < widget.data.length; i++) {
                            selectedEntities.remove(widget.data[i]);
                          }
                          setState(() {});
                          widget.onSelection?.call(
                            selectedEntities.toList(),
                          );
                        },
                      ),
                    SizedBox(
                      height: context.marginXS,
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: filteredData.length,
                        itemBuilder: (_, index) {
                          return SearchableListItem(
                            title: filteredData[index].title,
                            iconUrl: filteredData[index].iconUrl,
                            showTrailingArrow:
                                filteredData[index].showTrailingArrow,
                            isSelected:
                                selectedEntities.contains(filteredData[index]),
                            isSelectable: widget.isMultipleSelect,
                            onTap: () {
                              widget.onTap?.call(filteredData[index]);
                            },
                            onSelect: () {
                              setState(() {
                                selectedEntities.add(
                                  filteredData[index],
                                );
                              });
                              widget.onSelection?.call(
                                selectedEntities.toList(),
                              );
                            },
                            onUnSelect: () {
                              setState(() {
                                selectedEntities.remove(
                                  filteredData[index],
                                );
                              });
                              widget.onSelection?.call(
                                selectedEntities.toList(),
                              );
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox.shrink().paddingXS();
                        },
                      ),
                    ),
                  ],
                ),
        ),
        if (widget.data.length > 5) ...[
          SizedBox(
            height: context.marginXS,
          ),
          TextField(
            controller: searchController,
            onChanged: (value) {
              if (value != searchedQuery) {
                searchedQuery = value;
                filteredData = widget.data
                    .where(
                      (e) =>
                          e.title
                              .toLowerCase()
                              .contains(searchedQuery.toLowerCase()) ||
                          e.title.toLowerCase().trim() ==
                              searchedQuery.toLowerCase().trim(),
                    )
                    .toList();
                setState(() {});
              }
            },
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              isDense: true,
              hintText: context.l10n.search,
              prefixIcon: Icon(
                Icons.search,
                size: context.iconS,
              ),
            ),
          ).paddingSymmetric(
            horizontal: context.marginXS,
          ),
        ],
        if (widget.selectedEntities != null)
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    widget.onConfirm?.call(
                      selectedEntities.toList(),
                    );
                  },
                  child: MText(
                    text: context.l10n.confirm,
                  ),
                ),
              ),
              SizedBox(
                width: context.marginM,
              ),
              Expanded(
                child: OutlinedButton(
                  onPressed: widget.onCancel,
                  child: MText(
                    text: context.l10n.cancel,
                  ),
                ),
              ),
            ],
          ).paddingSymmetric(
            vertical: context.marginS,
            horizontal: context.marginXS,
          ),
      ],
    );
  }
}
