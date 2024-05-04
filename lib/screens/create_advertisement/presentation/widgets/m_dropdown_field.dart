import 'package:flutter/material.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:toggle_switch/toggle_switch.dart';

class MDropDownField extends StatefulWidget {
  const MDropDownField({
    required this.labels,
    this.onSelected,
    this.caption,
    this.icons,
    super.key,
  }) : assert(labels.length > 1, 'labels must be more than 1');

  final List<String> labels;
  final List<IconData>? icons;
  final String? caption;
  final void Function(int)? onSelected;

  @override
  State<MDropDownField> createState() => _MToggleFieldState();
}

class _MToggleFieldState extends State<MDropDownField> {
  late String? selectedValue = widget.labels.first;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.marginXS),
      child: Row(
        children: [
          if (widget.caption != null)
            MText(
              text: '${widget.caption!} : ',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ToggleSwitch(
            activeFgColor: Colors.white,
            inactiveBgColor: Colors.white,
            radiusStyle: true,
            labels: widget.labels,
            icons: widget.icons,
            onToggle: (index) {
              widget.onSelected?.call(index ?? 0);
            },
          ),
        ],
      ),
    );
  }
}
