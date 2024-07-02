import 'package:flutter/material.dart';
import 'package:landa/core/controllers/controllers.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';

class SelectableItemButton extends StatefulWidget {
  const SelectableItemButton({
    required this.title,
    required this.onClick,
    super.key,
    this.margin = EdgeInsets.zero,
    this.borderRadius = const BorderRadius.all(Radius.circular(4)),
    this.padding = const EdgeInsets.all(4),
    this.value,
    this.icon,
    this.borderWidth = 0.4,
    this.showArrow = true,
    this.textController,
    this.onChange,
    this.hasError = false,
    this.errorText,
  }) : assert(
          (value != null && textController == null) ||
              (textController != null && value == null) ||
              (textController == null && value == null),
          'one of textController or value property '
          'can be initialized at same time',
        );

  final String? errorText;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final bool hasError;
  final Function(String?)? onChange;
  final MTextEditingController? textController;
  final String title;
  final VoidCallback onClick;
  final Widget? icon;
  final String? value;
  final EdgeInsets margin;
  final double borderWidth;
  final bool showArrow;

  @override
  State<SelectableItemButton> createState() => _SelectableItemButtonState();
}

class _SelectableItemButtonState extends State<SelectableItemButton> {
  late String? value = widget.value ?? widget.textController?.text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClick,
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: widget.margin,
          padding: widget.padding,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius,
            border: Border.all(
              color: widget.hasError
                  ? Theme.of(context).colorScheme.error
                  : Theme.of(context).dividerColor,
              width: widget.borderWidth,
            ),
          ),
          child: Row(
            children: [
              if (widget.icon != null)
                widget.icon!.padding(left: Paddings.medium.value),
              MText(
                text: widget.title,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(),
              if (widget.textController != null && widget.value == null)
                ValueListenableBuilder(
                  valueListenable: widget.textController!,
                  builder: (_, newValue, __) {
                    if (newValue.text != value) {
                      value = newValue.text;
                      Future.microtask(() {
                        return widget.onChange?.call(newValue.text);
                      });
                    }
                    if (value != null) {
                      return MText(
                        text: value!,
                        style: Theme.of(context).textTheme.labelMedium,
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              if (widget.value != null && widget.textController == null)
                MText(
                  text: widget.value!,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              const SizedBox.shrink().paddingXXS(),
              if (widget.showArrow)
                Icon(
                  Icons.navigate_next_rounded,
                  size: context.iconM,
                ),
            ],
          ).paddingS(),
        ),
        if (widget.errorText != null)
          MText(
            text: widget.errorText!,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Theme.of(context).colorScheme.error),
          ).paddingS(),
      ],
    );
  }
}
