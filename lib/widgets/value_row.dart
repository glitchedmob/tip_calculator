import 'package:material_ui/material_ui.dart';

/// Keeps the original label/value row when it fits, and stacks only on overflow.
class ValueRow extends StatelessWidget {
  final String label;
  final String value;
  final double trailingPadding;

  const ValueRow({
    super.key,
    required this.label,
    required this.value,
    this.trailingPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return OverflowBar(
      alignment: MainAxisAlignment.spaceBetween,
      overflowAlignment: OverflowBarAlignment.end,
      overflowSpacing: 8,
      children: [
        Text(label),
        Padding(
          padding: EdgeInsets.only(right: trailingPadding),
          child: Text(value, textAlign: TextAlign.end),
        ),
      ],
    );
  }
}
