import 'package:material_ui/material_ui.dart';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:provider/provider.dart';

import 'package:tip_calculator/provider/tip_provider.dart';
import 'package:tip_calculator/screens/calculator.dart';
import 'package:tip_calculator/theme.dart';

class App extends StatefulWidget {
  const App({super.key, this.analytics});

  final FirebaseAnalytics? analytics;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final FirebaseAnalyticsObserver? _analyticsObserver;

  @override
  void initState() {
    super.initState();

    final analytics = widget.analytics;
    _analyticsObserver = analytics == null
        ? null
        : FirebaseAnalyticsObserver(analytics: analytics);
    analytics?.logAppOpen();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => TipProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorObservers: [?_analyticsObserver],
        theme: appTheme(),
        home: const CalculatorScreen(),
      ),
    );
  }
}
