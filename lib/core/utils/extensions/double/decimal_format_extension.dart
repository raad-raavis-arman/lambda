import 'package:intl/intl.dart';

extension DecimalFormatExtension on double {
  String format() {
    final formatter = NumberFormat.decimalPattern();
    return formatter.format(this);
  }
}
