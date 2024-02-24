import 'package:flutter/material.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

final lightPinTheme = PinTheme(
  shape: PinCodeFieldShape.box,
  activeColor: Colors.black38,
  activeFillColor: Colors.white,
  inactiveColor: Colors.grey[300],
  inactiveFillColor: Colors.white,
  selectedFillColor: Colors.white,
  selectedColor: Colors.black54,
  borderWidth: 2,
  borderRadius: BorderRadius.circular(6),
  fieldHeight: 60,
  fieldWidth: 50,
  errorBorderColor: lightColorScheme.error,
  errorBorderWidth: 2,
);

final darkPinTheme = PinTheme(
  shape: PinCodeFieldShape.box,
  activeColor: Colors.black38,
  activeFillColor: Colors.white,
  inactiveColor: Colors.grey[300],
  inactiveFillColor: Colors.white,
  selectedFillColor: Colors.white,
  selectedColor: Colors.black54,
  borderWidth: 2,
  borderRadius: BorderRadius.circular(6),
  fieldHeight: 60,
  fieldWidth: 50,
  errorBorderColor: darkColorScheme.error,
  errorBorderWidth: 2,
);
