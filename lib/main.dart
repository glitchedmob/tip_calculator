import 'package:flutter/material.dart';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:tip_calculator/app.dart';
import 'package:tip_calculator/env.dart';

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

Future start() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  if (!Env.enableAnalytics) {
    await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(false);
  }

  runApp(const App());
}
