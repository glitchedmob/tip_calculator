import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sentry/sentry.dart';

bool get isInDebugMode {
  var inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

class ErrorTracker {
  final SentryClient _sentry = new SentryClient(dsn: DotEnv().env['SENTRY_DSN']);

  void reportError(dynamic error, dynamic stackTrace) {
    print('Caught error: $error');

    if (isInDebugMode) {
      print(stackTrace);
      return;
    }

    try {
      _sentry.captureException(
        exception: error,
        stackTrace: stackTrace,
      );
    } catch (e) {
      print('Sending report to sentry.io failed: $e');
      print('Original error: $error');
    }
  }
}
