import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:tip_calculator/provider/tip_provider.dart';

class Keypad extends StatelessWidget {
  const Keypad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildRow(children: <Widget>[
          _buildButton(context, '7'),
          _buildButton(context, '8'),
          _buildButton(context, '9'),
        ]),
        _buildRow(children: <Widget>[
          _buildButton(context, '4'),
          _buildButton(context, '5'),
          _buildButton(context, '6'),
        ]),
        _buildRow(children: <Widget>[
          _buildButton(context, '1'),
          _buildButton(context, '2'),
          _buildButton(context, '3'),
        ]),
        _buildRow(children: <Widget>[
          _buildButton(context, 'AC', accent: true),
          _buildButton(context, '0'),
          _buildButton(
            context,
            'DEL',
            accent: true,
            child: const Icon(Icons.backspace, size: 40),
          ),
        ]),
      ],
    );
  }

  Widget _buildRow({required List<Widget> children}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      ),
    );
  }

  Widget _buildButton(BuildContext context, String command,
      {Widget? child, bool accent = false}) {
    Widget content;

    if (child == null) {
      content = Text(
        command,
        style: const TextStyle(fontSize: 25),
      );
    } else {
      content = child;
    }

    return SizedBox(
      width: 85,
      height: 85,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            shape: const CircleBorder(),
            foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
            backgroundColor: accent
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).primaryColor),
        child: content,
        onPressed: () {
          _onKeyPress(context, command);
        },
      ),
    );
  }

  _onKeyPress(BuildContext context, String command) {
    var tipProvider = context.read<TipProvider>();

    if (command == 'AC') {
      tipProvider.reset();
      _vibrateLong();
      return;
    }

    var text = tipProvider.billAmount.toString();

    if (command == 'DEL') {
      if (text == '0') {
        _vibrateLong();
        return;
      }
      text = text.substring(0, text.length - 1);
    } else {
      text = '$text$command';
    }

    if (text.length >= 10) {
      _vibrateLong();
      return;
    }

    _vibrateShort();

    tipProvider.billAmount = int.tryParse(text) ?? 0;
  }

  _vibrateShort() {
    HapticFeedback.selectionClick();
  }

  _vibrateLong() {
    if (Platform.isAndroid) {
      HapticFeedback.vibrate();
    }

    if (Platform.isIOS) {
      HapticFeedback.mediumImpact();
    }
  }
}
