import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:tip_calculator/env.dart';
import 'package:tip_calculator/app.dart';

Future main() async {
  if (!Env.enableErrorTracking) {
    return start();
  }

  return SentryFlutter.init(
    (options) {
      options.dsn = Env.sentryDsn;
    },
    appRunner: start,
  );
}

void start() {
  runApp(const App());
}
