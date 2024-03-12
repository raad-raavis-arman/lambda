import 'package:flutter/material.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/core/widgets/widgets.dart';

class TextController extends ValueNotifier<String?> {
  TextController({String? initialValue}) : super(initialValue);
}

class SelectableItemButton extends StatelessWidget {
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
  }) : assert(
          (value != null && textController == null) ||
              (textController != null && value == null) ||
              (textController == null && value == null),
          'one of textController or value property '
          'can be initialized at same time',
        );
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final bool hasError;
  final Function(String?)? onChange;
  final TextController? textController;
  final String title;
  final VoidCallback onClick;
  final Widget? icon;
  final String? value;
  final EdgeInsets margin;
  final double borderWidth;
  final bool showArrow;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: Border.all(
          color: hasError
              ? Theme.of(context).colorScheme.error
              : Theme.of(context).dividerColor,
          width: borderWidth,
        ),
      ),
      child: Row(
        children: [
          if (icon != null) icon!.padding(left: Paddings.medium.value),
          MText(
            text: title,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Spacer(),
          if (textController != null && value == null)
            ValueListenableBuilder(
              valueListenable: textController!,
              builder: (_, newValue, __) {
                Future.microtask(() => onChange?.call(newValue));
                if (newValue != null) {
                  return MText(
                    text: newValue,
                    style: Theme.of(context).textTheme.titleSmall,
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          if (value != null && textController == null)
            MText(
              text: value!,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          const SizedBox.shrink().paddingM(),
          if (showArrow)
            Icon(
              Icons.navigate_next_rounded,
              size: context.iconM,
            ),
        ],
      ).paddingS(),
    );
  }
}
