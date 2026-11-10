import 'package:material_ui/material_ui.dart';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:tip_calculator/app.dart';
import 'package:tip_calculator/env.dart';
import 'package:tip_calculator/firebase_options.dart';

const _enableAnalytics = bool.fromEnvironment(
  'ENABLE_ANALYTICS',
  defaultValue: Env.enableAnalytics,
);
const _enableErrorTracking = bool.fromEnvironment(
  'ENABLE_ERROR_TRACKING',
  defaultValue: Env.enableErrorTracking,
);

Future<void> main() async {
  GoogleFonts.config.allowRuntimeFetching = false;

  if (!_enableErrorTracking) {
    return start();
  }

  return SentryFlutter.init((options) {
    options.dsn = Env.sentryDsn;
  }, appRunner: start);
}

Future<void> start() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final analytics = FirebaseAnalytics.instance;
  await analytics.setAnalyticsCollectionEnabled(_enableAnalytics);

  runApp(App(analytics: _enableAnalytics ? analytics : null));
}
