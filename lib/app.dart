import 'package:flutter/material.dart';

import 'package:tip_calculator/theme.dart';
import 'package:tip_calculator/screens/calculator.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(context),
      home: CalculatorScreen(),
    );
  }
}
