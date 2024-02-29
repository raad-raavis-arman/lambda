import 'package:flutter/material.dart';

extension PaddingX on Widget {
  Widget padding({
    double top = 0,
    double right = 0,
    double left = 0,
    double bottom = 0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: top,
        right: right,
        left: left,
        bottom: bottom,
      ),
      child: this,
    );
  }

  Widget paddingXL() {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: this,
    );
  }

  Widget paddingL() {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: this,
    );
  }

  Widget paddingM() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: this,
    );
  }

  Widget paddingS() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: this,
    );
  }
  
  Widget paddingXS() {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: this,
    );
  }
}
