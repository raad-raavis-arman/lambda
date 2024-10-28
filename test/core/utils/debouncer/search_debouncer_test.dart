import 'package:landa/core/utils/utils.dart';
import 'package:test/test.dart';

void main() {
  group('SearchDebouncer', () {
    const duration = Duration(milliseconds: 400);
    late SearchDebouncer searchDebouncer;
    setUp(() {
      searchDebouncer = SearchDebouncer(duration: duration);
    });

    test('must call action after specified duration', () async {
      //arrage
      int numberOfCallbackCall = 0;
      //act
      searchDebouncer.run(() {
        numberOfCallbackCall++;
      });
      await Future.delayed(duration);
      //assert
      expect(numberOfCallbackCall, equals(1));
    });

    test('must not call action when reset called before specified duration',
        () async {
      //arrage
      int numberOfCallbackCall = 0;
      //act
      searchDebouncer
        ..run(() {
          numberOfCallbackCall++;
        })
        ..reset();
      await Future.delayed(duration);
      //assert
      expect(numberOfCallbackCall, equals(0));
    });

    test(
        'must call action when the run function called after the reset funtion '
        'called at the specified duration', () async {
      //arrage
      int numberOfCallbackCall1 = 0;
      int numberOfCallbackCall2 = 0;
      //act
      searchDebouncer
        ..run(() {
          numberOfCallbackCall1++;
        })
        ..reset()
        ..run(() {
          numberOfCallbackCall2++;
        });
      await Future.delayed(duration);
      //assert
      expect(numberOfCallbackCall1, equals(0));
      expect(numberOfCallbackCall2, equals(1));
    });

    test(
        'must call the action callback once when the run function called '
        'multiple times before the duration', () async {
      //arrage
      int numberOfCallbackCall = 0;
      //act
      searchDebouncer
        ..run(() {
          numberOfCallbackCall++;
        })
        ..run(() {
          numberOfCallbackCall++;
        });
      await Future.delayed(Duration.zero);
      searchDebouncer.run(
        () {
          numberOfCallbackCall++;
        },
      );
      await Future.delayed(duration);
      //assert
      expect(numberOfCallbackCall, equals(1));
    });

    test(
        'must call the action callback two times when the run function called '
        'after the duration of first run again', () async {
      //arrage
      int numberOfCallbackCall = 0;
      //act
      searchDebouncer.run(() {
        numberOfCallbackCall++;
      });
      await Future.delayed(duration);
      searchDebouncer.run(() {
        numberOfCallbackCall++;
      });
      await Future.delayed(duration);
      //assert
      expect(numberOfCallbackCall, equals(2));
    });

    tearDown(() {
      searchDebouncer.reset();
    });
  });
}
