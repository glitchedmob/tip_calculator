import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:tip_calculator/provider/tip_provider.dart';
import 'package:tip_calculator/widgets/app_expansion_tile.dart';
import 'package:tip_calculator/widgets/expansion_tile_option.dart';

class TipPercentExpansionTile extends StatelessWidget {
  final bool expanded;
  final GestureTapCallback onTap;

  const TipPercentExpansionTile({
    super.key,
    required this.expanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var tipProvider = context.watch<TipProvider>();

    return AppExpansionTile(
      expanded: expanded,
      onHeaderTap: onTap,
      header: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text('Tip %'),
          Text('${_formatPercent(tipProvider.tipPercent)}%'),
        ],
      ),
      children: <Widget>[
        _buildOption(context, 10),
        _buildOption(context, 15),
        _buildOption(context, 20),
        _buildOption(context, 25),
      ],
    );
  }

  String _formatPercent(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }

  Widget _buildOption(BuildContext context, int value) {
    var tipProvider = context.watch<TipProvider>();

    return ExpansionTileOption(
      text: '$value%',
      onTap: () {
        tipProvider.tipPercent = value.toDouble();
        onTap();
      },
    );
  }
}
