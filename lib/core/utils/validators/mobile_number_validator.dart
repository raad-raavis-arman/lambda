import 'package:landa/core/utils/extensions/extensions.dart';

mixin MobileNumberValidator {
  bool validateMobileNumber(String mobileNumber) {
    return RegExp(
      r'(0|\+98)?([ ]|-|[()]){0,2}9[0-9]([ ]|-|[()]){0,2}(?:[0-9]([ ]|-|[()]){0,2}){8}',
    ).hasMatch(mobileNumber.replaceFaNumToEn());
  }
}
