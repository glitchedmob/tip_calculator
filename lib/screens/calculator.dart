import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';

import 'package:tip_calculator/widgets/display.dart';
import 'package:tip_calculator/widgets/keypad.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final wide =
                constraints.maxWidth >= 700 ||
                (constraints.maxWidth >= 480 &&
                    constraints.maxWidth > constraints.maxHeight);

            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: wide
                    ? _buildWide(constraints.maxHeight)
                    : _buildCompact(constraints.maxHeight),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCompact(double height) {
    return Column(
      children: [
        const Expanded(child: ResultDisplay()),
        const Divider(height: 3, thickness: 3, color: Color(0xff212121)),
        SizedBox(height: math.min(30, height * 0.05)),
        SizedBox(
          height: math.min(Keypad.preferredHeight, height * 0.62),
          child: const Keypad(),
        ),
      ],
    );
  }

  Widget _buildWide(double height) {
    return Row(
      children: [
        const Expanded(flex: 3, child: ResultDisplay()),
        const VerticalDivider(width: 3, thickness: 3, color: Color(0xff212121)),
        Expanded(
          flex: 2,
          child: Center(
            child: SizedBox(
              height: math.min(Keypad.preferredHeight, height),
              child: const Keypad(),
            ),
          ),
        ),
      ],
    );
  }
}
