import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tip_calculator/utils/error_tracking.dart';

import 'app.dart';

Future main() async {
  await DotEnv().load('.env');

  var errorTracker = ErrorTracker();

  FlutterError.onError = (FlutterErrorDetails details, {bool forceReport = false}) async {
    if (isInDebugMode) {
      FlutterError.dumpErrorToConsole(details, forceReport: forceReport);
    } else {
      errorTracker.reportError(details.exception, details.stack);
    }
  };

  runZoned(
    () => runApp(App()),
    onError: (error, stackTrace) {
      errorTracker.reportError(error, stackTrace);
    },
  );
}