import 'package:flutter/material.dart';

import 'package:tip_calculator/widgets/display.dart';
import 'package:tip_calculator/widgets/keypad.dart';

class CalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(child: ResultDisplay()),
          Container(height: 3, color: Theme.of(context).primaryColor),
          Padding(padding: EdgeInsets.only(bottom: 30)),
          Keypad(),
        ],
      ),
    );
  }
}
