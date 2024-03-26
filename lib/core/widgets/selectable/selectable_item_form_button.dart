import 'package:flutter/material.dart';
import 'package:landa/core/widgets/widgets.dart';

class SelectableItemFormButton extends FormField<String> {
  SelectableItemFormButton({
    required String title,
    required VoidCallback onClick,
    super.onSaved,
    super.validator,
    super.restorationId,
    super.enabled,
    super.autovalidateMode = AutovalidateMode.disabled,
    super.key,
    EdgeInsets margin = EdgeInsets.zero,
    String? value,
    Widget? icon,
    double borderWidth = 0.4,
    bool showArrow = true,
    TextController? textController,
    Function(String?)? onChange,
    EdgeInsets padding = const EdgeInsets.all(4),
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(4)),
  })  : assert(
          (value != null && textController == null) ||
              (textController != null && value == null) ||
              (textController == null && value == null),
          'one of textController or value property '
          'can be initialized at same time',
        ),
        super(
          initialValue: value ?? textController?.value,
          builder: (state) {
            return UnmanagedRestorationScope(
              bucket: state.bucket,
              child: SelectableItemButton(
                title: title,
                onClick: onClick,
                margin: margin,
                value: value,
                icon: icon,
                padding: padding,
                borderRadius: borderRadius,
                borderWidth: borderWidth,
                showArrow: showArrow,
                textController: textController,
                hasError: state.hasError,
                errorText: state.errorText,
                onChange: (newValue) {
                  state.didChange(newValue);
                  onChange?.call(newValue);
                },
              ),
            );
          },
        );
}
