import 'package:flutter/material.dart';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:provider/provider.dart';

import 'package:tip_calculator/provider/tip_provider.dart';
import 'package:tip_calculator/screens/calculator.dart';
import 'package:tip_calculator/theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  static final _analyticsObserver = FirebaseAnalyticsObserver(
    analytics: FirebaseAnalytics.instance,
  );

  @override
  void initState() {
    super.initState();

    FirebaseAnalytics.instance.logAppOpen().then((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TipProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorObservers: [_analyticsObserver],
        theme: appTheme(context),
        home: const CalculatorScreen(),
      ),
    );
  }
}
