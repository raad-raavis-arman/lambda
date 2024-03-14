import 'package:flutter/services.dart';
import 'package:landa/core/utils/extensions/double/decimal_format_extension.dart';
import 'package:landa/core/utils/utils.dart';

class NumberSeparatorFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      var newString = newValue.text.parseDouble().format();
      if (newValue.text.endsWith('.')) {
        newString += '.';
      }
      return TextEditingValue(
        text: newString.replaceEnNumToFa(),
        selection: TextSelection.collapsed(
          offset: newString.length,
        ),
      );
    } else {
      return newValue;
    }
  }
}
