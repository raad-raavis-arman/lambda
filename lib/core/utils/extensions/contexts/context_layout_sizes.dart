import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension ContextLayoutSizes on BuildContext {
  double get screenWidth {
    final mediaQueryData = MediaQuery.of(this);
    final orientation = mediaQueryData.orientation;
    return orientation == Orientation.landscape
        ? mediaQueryData.size.longestSide
        : mediaQueryData.size.shortestSide;
  }

  double get screenHeight {
    final mediaQueryData = MediaQuery.of(this);
    final orientation = mediaQueryData.orientation;
    return orientation == Orientation.landscape
        ? mediaQueryData.size.shortestSide
        : mediaQueryData.size.longestSide;
  }

  Size get targetDeviceSize {
    if (screenWidth < 479) {
      //mobile
      return const Size(390, 844);
    } else if (screenWidth < 767) {
      //tablet
      return const Size(1024, 1366);
    } else {
      // desktop
      return const Size(1920, 1080);
    }
  }

  double rW(double value) => screenWidth * (value / targetDeviceSize.width);

  double rH(double value) => screenHeight * (value / targetDeviceSize.height);
  // margins
  double get marginXS => rW(6);
  double get marginS => rW(8);
  double get marginM => rW(12);
  double get marginL => rW(16);

  //border radius

  double get radiusS => rW(6);
  double get radiusM => rW(10);
  double get radiusL => rW(14);
  double get radiusXL => rW(18);
  double get radiusXXL => rW(22);
}
