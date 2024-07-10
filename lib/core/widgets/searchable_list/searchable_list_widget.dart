import 'package:flutter/material.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/searchable_list/searchable_list.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';

class SearchableListWidget extends StatefulWidget {
  const SearchableListWidget({
    required this.data,
    this.onTap,
    super.key,
  });

  final List<SearchableListEntity> data;
  final void Function(int)? onTap;

  @override
  State<SearchableListWidget> createState() => _SearchableListWidgetState();
}

class _SearchableListWidgetState extends State<SearchableListWidget> {
  late List<SearchableListEntity> filteredData = widget.data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: filteredData.isEmpty
              ? Center(
                  child: MText(
                    text: context.l10n.thereIsNoData,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                )
              : ListView.separated(
                  itemCount: filteredData.length,
                  itemBuilder: (_, index) {
                    return SearchableListItem(
                      entity: filteredData[index],
                      onTap: () {
                        widget.onTap?.call(
                          widget.data.indexOf(filteredData[index]),
                        );
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox.shrink().paddingXS();
                  },
                ),
        ),
        TextField(
          onChanged: (value) {
            filteredData = widget.data
                .where(
                  (e) => e.title.contains(value),
                )
                .toList();
            setState(() {});
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
        ),
      ],
    );
  }
}
