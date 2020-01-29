import 'dart:async';

//import 'package:flutter_dotenv/flutter_dotenv.dart';
//import 'package:sentry/sentry.dart';

bool get isInDebugMode {
  var inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

class ErrorTracker {
//  final SentryClient _sentry = new SentryClient(dsn: DotEnv().env['SENTRY_DSN']);

  Future<Null> reportError(dynamic error, dynamic stackTrace) async {
    print('Caught error: $error');

    if (isInDebugMode) {
      print(stackTrace);
      return;
    }

//    final SentryResponse response = await _sentry.captureException(
//      exception: error,
//      stackTrace: stackTrace,
//    );
//
//    if (!response.isSuccessful) {
//      print('Failed to report to Sentry.io: ${response.error}');
//    }
  }
}
