import 'package:flutter_test/flutter_test.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:landa/l10n/l10n.dart';
import 'package:landa/screens/shared/presentaion/widgets/widgets.dart';

import '../../../../helper/widget_testing/widget_testing.dart';

void main() {
  group('CountDownTime', () {
    testWidgets('widget must render three CountDownItem', (tester) async {
      // Arrange
      final createDateTime = DateTime.now();
      final expireDateTime = DateTime.now().add(const Duration(seconds: 1));

      await tester.pumpWidget(
        MakeTestableWidget(
          child: CountDownTime(
            creationDateTime: createDateTime,
            expireDateTime: expireDateTime,
          ),
        ),
      );

      // Act

      // Assert
      expect(find.byType(CountDownTime), findsOneWidget);
      expect(find.byType(CountDownTimeItem), findsNWidgets(3));
      final firstCountDownItem =
          tester.firstWidget(find.byType(CountDownTimeItem));
      final context = tester.element(find.byWidget(firstCountDownItem));
      expect(find.text(context.l10n.day), findsOneWidget);
      expect(find.text(context.l10n.hour), findsOneWidget);
      expect(find.text(context.l10n.minute), findsOneWidget);
    });

    testWidgets('widget must show correct timer initial value', (tester) async {
      // Arrange
      final createDateTime = DateTime.now();
      final expireDateTime = DateTime.now().add(const Duration(days: 2));

      await tester.pumpWidget(
        MakeTestableWidget(
          child: CountDownTime(
            creationDateTime: createDateTime,
            expireDateTime: expireDateTime,
          ),
        ),
      );

      // Act
      await tester.pump();

      // Assert
      expect(find.byType(CountDownTime), findsOneWidget);
      final firstCountDownItem =
          tester.firstWidget(find.byType(CountDownTimeItem));
      final context = tester.element(find.byWidget(firstCountDownItem));
      final isPersian = context.isPersian;
      expect(find.text(isPersian ? '۰' : '0'), findsNWidgets(2));
      expect(find.text(isPersian ? '۲' : '2'), findsOneWidget);
    });
  });
}
