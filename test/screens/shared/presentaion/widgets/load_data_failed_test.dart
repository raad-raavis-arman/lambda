import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:landa/core/widgets/widgets.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/shared/presentaion/widgets/widgets.dart';

import '../../../../helper/widget_testing/make_testable_widget.dart';

void main() {
  group(
    'LoadDataFailed',
    () {
      testWidgets(
        'widget must render one MText and a TextButton with MText child',
        (tester) async {
          // Arrange
          await tester.pumpWidget(
            const MakeTestableWidget(
              child: LoadDataFailed(),
            ),
          );

          // Act

          // Assert
          expect(find.byType(LoadDataFailed), findsOneWidget);
          expect(find.byType(MText), findsNWidgets(2));
          expect(find.byType(TextButton), findsOneWidget);
        },
      );

      testWidgets(
        'the "try again" callback must trigger when user tap on TextButton',
        (tester) async {
          // Arrange
          bool isTapped = false;
          await tester.pumpWidget(
            MakeTestableWidget(
              child: LoadDataFailed(
                tryAgain: () {
                  isTapped = true;
                },
              ),
            ),
          );

          // Act

          await tester.tap(find.byType(TextButton));
          await tester.pump();

          // Assert
          expect(find.byType(LoadDataFailed), findsOneWidget);
          expect(isTapped, isTrue);
        },
      );

      testWidgets(
        'the "errorMessage" must be replaced when passing through constructor',
        (tester) async {
          // Arrange
          const errorMessage = 'Failed to load data';
          await tester.pumpWidget(
            const MakeTestableWidget(
              child: LoadDataFailed(
                errorMessage: errorMessage,
              ),
            ),
          );

          // Act

          // Assert
          expect(find.byType(LoadDataFailed), findsOneWidget);
          expect(find.text(errorMessage), findsOneWidget);
        },
      );

      testWidgets(
        'the default "errorMessage" from localization must show in widget',
        (tester) async {
          // Arrange
          await tester.pumpWidget(
            const MakeTestableWidget(
              child: LoadDataFailed(),
            ),
          );

          // Act

          // Assert
          expect(find.byType(LoadDataFailed), findsOneWidget);
          final messageWidget = tester.firstWidget<MText>(find.byType(MText));
          final context = tester.element(find.byWidget(messageWidget));
          expect(messageWidget.text, context.l10n.loadingDataFailed);
        },
      );
    },
  );
}
