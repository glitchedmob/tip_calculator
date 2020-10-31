import 'package:flutter/material.dart';
import 'package:flutter_sentry/flutter_sentry.dart';

import 'package:tip_calculator/env.dart';
import 'package:tip_calculator/utils/utils.dart';
import 'package:tip_calculator/app.dart';


Future main() async {
  if (getEnvironment() == 'debug') {
    return start();
  }

  return FlutterSentry.wrap(
    () async => start(),
    dsn: Env.sentryDsn,
  );
}

void start() {
  runApp(App());
}
