import 'package:flutter/foundation.dart';
import 'package:landa/core/utils/logger/logger.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> sentToSentry({
  required Object exception,
  required StackTrace stackTrace,
  String? message,
  Map<String, dynamic>? json,
}) async {
  if (kDebugMode) {
    logger.e(
      message,
      error: exception,
      stackTrace: stackTrace,
      time: DateTime.now(),
    );
  } else {
    if (message != null) {
      await Sentry.captureMessage('message:$message  \ndata:$json');
    }
    await Sentry.captureException(exception, stackTrace: stackTrace);
  }
}
