import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:landa/screens/shared/presentaion/widgets/widgets.dart';

void main() {
  group('CountDownTimeItem', () {
    testWidgets('renders correctly', (tester) async {
      // Arrange
      const label = 'label';
      const time = 20;
      const bgColor = Colors.red;

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CountDownTimeItem(
              label: label,
              time: time,
              bgColor: bgColor,
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(CountDownTimeItem), findsOneWidget);
      expect(find.text(label), findsOneWidget);
      expect(find.text(time.toString()), findsOneWidget);
      expect(find.byType(Container), findsNWidgets(2));
      expect(
        (tester.firstWidget<Container>(find.byType(Container)).decoration!
                as BoxDecoration)
            .color,
        isSameColorAs(bgColor),
      );
    });

    testWidgets('show label correctly', (tester) async {
      // Arrange
      const label = 'label';

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CountDownTimeItem(
              label: label,
            ),
          ),
        ),
      );

      // Assert
      expect(find.text(label), findsOneWidget);
    });

    testWidgets('show time correctly', (tester) async {
      // Arrange
      const label = 'label';
      const time = 20;

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CountDownTimeItem(
              label: label,
              time: time,
            ),
          ),
        ),
      );

      // Assert
      expect(find.text(time.toString()), findsOneWidget);
    });

    testWidgets('show background color correctly', (tester) async {
      // Arrange
      const label = 'label';
      const time = 20;
      const bgColor = Colors.red;

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CountDownTimeItem(
              label: label,
              time: time,
              bgColor: bgColor,
            ),
          ),
        ),
      );

      // Assert
      expect(
        (tester.firstWidget<Container>(find.byType(Container)).decoration!
                as BoxDecoration)
            .color,
        isSameColorAs(bgColor),
      );
    });
  });
}
