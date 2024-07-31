import 'dart:async';
import 'dart:ui';

class SearchDebouncer {
  SearchDebouncer({required this.milliseconds});

  final int milliseconds;
  Timer? timer;

  void run(VoidCallback action) {
    if (timer != null) {
      timer!.cancel();
    }
    timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void reset() {
    timer = null;
  }
}
