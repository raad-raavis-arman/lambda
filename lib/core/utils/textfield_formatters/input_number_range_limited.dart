import 'package:flutter/services.dart';
import 'package:landa/core/utils/utils.dart';

class InputNumberRangeLimited extends TextInputFormatter {
  const InputNumberRangeLimited({
    this.begin = double.negativeInfinity,
    this.end = double.infinity,
  });
  final double begin;
  final double end;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      final inputValue = newValue.text;
      try {
        final doubleValue = double.parse(inputValue.replaceFaNumToEn());
        if (doubleValue >= begin && doubleValue <= end) {
          return newValue;
        } else if (doubleValue < begin) {
          return newValue.copyWith(text: begin.toString().replaceEnNumToFa());
        } else if (doubleValue > end) {
          return newValue.copyWith(text: end.toString().replaceEnNumToFa());
        }
        return newValue.copyWith(text: newValue.text.replaceEnNumToFa());
      } on Exception catch (_) {
        return newValue.copyWith(text: newValue.text.replaceEnNumToFa());
      }
    } else {
      return newValue;
    }
  }
}
