import 'package:flutter/material.dart';

class MTextEditingController<T> extends TextEditingController {
  MTextEditingController({
    super.text,
    this.object,
  });

  T? object;
}
