import 'package:flutter/services.dart';
import 'package:landa/core/utils/extensions/strings/strings.dart';

class TextFieldPersianFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      return newValue.copyWith(
        text: newValue.text.replaceEnNumToFa(),
        selection: TextSelection.collapsed(offset: newValue.selection.start),
      );
    } else {
      return newValue;
    }
  }
}
