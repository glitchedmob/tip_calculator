import 'package:flutter/material.dart';

import 'package:tip_calculator/widgets/display.dart';
import 'package:tip_calculator/widgets/keypad.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        left: false,
        right: false,
        top: false,
        child: MediaQuery.of(context).orientation == Orientation.portrait
            ? _buildPortrait(context)
            : _buildLandscape(context),
      ),
    );
  }

  Widget _buildPortrait(BuildContext context) {
    return Column(
      children: <Widget>[
        const Expanded(child: ResultDisplay()),
        Container(height: 3, color: Theme.of(context).colorScheme.primary),
        const Padding(padding: EdgeInsets.only(bottom: 30)),
        const Keypad(),
      ],
    );
  }

  Widget _buildLandscape(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
          flex: 3,
          child: ResultDisplay(),
        ),
        Container(width: 3, color: Theme.of(context).colorScheme.primary),
        const Expanded(
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
