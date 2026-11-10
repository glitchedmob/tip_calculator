import 'dart:math' as math;

import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;

import 'package:flutter/services.dart';

import 'package:material_ui/material_ui.dart';

import 'package:provider/provider.dart';

import 'package:tip_calculator/provider/tip_provider.dart';

class Keypad extends StatelessWidget {
  const Keypad({super.key});

  static const preferredHeight = 380.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final widthSize = ((constraints.maxWidth - 32) / 3).clamp(48.0, 85.0);
        final heightSize = ((constraints.maxHeight - 40) / 4).clamp(48.0, 85.0);
        final buttonSize = math.min(widthSize, heightSize);

        return OutlinedButtonTheme(
          data: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              fixedSize: Size.square(buttonSize),
              minimumSize: const Size.square(48),
              padding: EdgeInsets.zero,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildRow(
                  children: <Widget>[
                    _buildButton(context, '7'),
                    _buildButton(context, '8'),
                    _buildButton(context, '9'),
                  ],
                ),
                _buildRow(
                  children: <Widget>[
                    _buildButton(context, '4'),
                    _buildButton(context, '5'),
                    _buildButton(context, '6'),
                  ],
                ),
                _buildRow(
                  children: <Widget>[
                    _buildButton(context, '1'),
                    _buildButton(context, '2'),
                    _buildButton(context, '3'),
                  ],
                ),
                _buildRow(
                  children: <Widget>[
                    _buildButton(context, 'AC', accent: true),
                    _buildButton(context, '0'),
                    _buildButton(
                      context,
                      'DEL',
                      accent: true,
                      child: const Icon(Icons.backspace, size: 40),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
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

  Widget _buildButton(
    BuildContext context,
    String command, {
    Widget? child,
    bool accent = false,
  }) {
    Widget content;

    if (child == null) {
      content = FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(command, style: const TextStyle(fontSize: 25)),
      );
    } else {
      content = child;
    }

    return Semantics(
      label: command == 'AC'
          ? 'Clear bill'
          : command == 'DEL'
          ? 'Delete last digit'
          : null,
      excludeSemantics: command == 'AC' || command == 'DEL',
      button: true,
      onTap: () => _onKeyPress(context, command),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide.none,
          shape: const CircleBorder(),
          foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
          backgroundColor: accent
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.primary,
        ),
        child: content,
        onPressed: () {
          _onKeyPress(context, command);
        },
      ),
    );
  }

  void _onKeyPress(BuildContext context, String command) {
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

  void _vibrateShort() {
    if (!kIsWeb) {
      HapticFeedback.selectionClick();
    }
  }

  void _vibrateLong() {
    if (kIsWeb) return;

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        HapticFeedback.vibrate();
      case TargetPlatform.iOS:
        HapticFeedback.mediumImpact();
      default:
        break;
    }
  }
}
