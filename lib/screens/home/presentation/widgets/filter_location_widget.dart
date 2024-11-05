import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/advertisement_area/domain/entities/entities.dart';

class FilterLocationWidget extends StatefulWidget {
  const FilterLocationWidget({
    this.onFilteredLocation,
    super.key,
  });

  final Function(List<City>)? onFilteredLocation;

  @override
  State<FilterLocationWidget> createState() => _FilterLocationWidgetState();
}

class _FilterLocationWidgetState extends State<FilterLocationWidget> {
  final List<City> selectedCities = [];
  late String filteredLocations = context.l10n.allCities;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return InkWell(
      onTap: () {
        context.pushNamed<List<City>?>(
          RouteNames.advertisementArea,
          extra: {
            'isMultipleSelect': true,
            'selectedCities': selectedCities,
          },
        ).then(
          (result) {
            if (result != null) {
              selectedCities
                ..clear()
                ..addAll(result);
              filteredLocations = selectedCities.isEmpty
                  ? l10n.allCities
                  : l10n.numOfCity(selectedCities.length);
              widget.onFilteredLocation?.call(selectedCities);
              setState(() {});
            }
          },
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.location_on_outlined,
            size: context.iconS,
          ),
          Container(
            height: 0.7,
            width: 15,
            margin: const EdgeInsets.symmetric(
              vertical: 2,
            ),
            color: Theme.of(context).dividerColor,
          ),
          MText(
            text: filteredLocations,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
