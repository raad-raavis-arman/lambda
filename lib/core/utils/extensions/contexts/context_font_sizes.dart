import 'package:flutter/material.dart';

extension ContextFontSizes on BuildContext {
  double fontSize(double value) {
    return MediaQuery.of(this).textScaler.scale(value);
  }

  double get iconS => fontSize(18);
  double get iconM => fontSize(24);
  double get iconL => fontSize(28);
}
