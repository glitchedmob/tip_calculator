import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tip_calculator/utils/error_tracking.dart';

import 'app.dart';

Future main() async {
  await DotEnv().load('.env');

  var errorTracker = ErrorTracker();

  FlutterError.onError = (FlutterErrorDetails details) async {
    if (isInDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };

  runZoned<Future<Null>>(
        () async {
      runApp(App());
    },
    onError: (error, stackTrace) async {
      await errorTracker.reportError(error, stackTrace);
    },
  );
}