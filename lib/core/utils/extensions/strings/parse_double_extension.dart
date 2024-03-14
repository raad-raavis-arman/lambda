import 'package:landa/core/utils/utils.dart';

extension ParseDoubleExtension on String {
  double parseDouble() {
    if (isEmpty) return 0;
    try {
      return double.parse(replaceFaNumToEn().replaceAll(',', '').trim());
    } on Exception catch (_) {
      return 0;
    }
  }
}
