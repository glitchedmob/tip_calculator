import 'package:flutter/material.dart';
import 'package:tip_calculator/widgets/keypad.dart';

class CalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(child: Container()),
        Container(height: 2),
        Keypad(),
      ],
    );
  }
}
