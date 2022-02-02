import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_calculator/provider/tip_provider.dart';

import 'package:tip_calculator/theme.dart';
import 'package:tip_calculator/screens/calculator.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TipProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme(context),
        home: CalculatorScreen(),
      ),
    );
  }
}
