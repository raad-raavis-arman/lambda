import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:landa/l10n/l10n.dart';

abstract class TestRobot {
  TestRobot({
    required this.tester,
  });

  final WidgetTester tester;

  AppLocalizations get l10n {
    final scaffold = tester.firstWidget(find.byType(Scaffold));
    return tester.element(find.byWidget(scaffold)).l10n;
  }
}
