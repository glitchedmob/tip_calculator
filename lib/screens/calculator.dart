import 'package:flutter/material.dart';

import 'package:tip_calculator/widgets/display.dart';
import 'package:tip_calculator/widgets/keypad.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.of(context).orientation == Orientation.portrait
          ? buildPortrait(context)
          : buildLandscape(context),
    );
  }

  Widget buildPortrait(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(child: ResultDisplay()),
        Container(height: 3, color: Theme.of(context).primaryColor),
        const Padding(padding: EdgeInsets.only(bottom: 30)),
        Keypad(),
      ],
    );
  }

  Widget buildLandscape(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: ResultDisplay(),
        ),
        Container(width: 3, color: Theme.of(context).primaryColor),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Keypad(),
            ],
          ),
        ),
      ],
    );
  }
}
