import 'package:intl/intl.dart';
import 'package:shamsi_date/shamsi_date.dart';

extension UtcToJalaliFormatter on String {
  String utcToJalaliFormatter() {
    final jalali = Jalali.fromDateTime(
      DateTime.parse(this),
    );
    final twoDigitFormat = NumberFormat('00');
    return '${jalali.year}-${twoDigitFormat.format(jalali.month)}'
        '-${twoDigitFormat.format(jalali.day)} '
        '${twoDigitFormat.format(jalali.hour)}'
        ':${twoDigitFormat.format(jalali.minute)}';
  }
}
