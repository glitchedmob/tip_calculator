import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tip_calculator/provider/tip_provider.dart';
import 'package:tip_calculator/widgets/app_expansion_tile.dart';
import 'package:tip_calculator/widgets/expansion_tile_option.dart';

class TipPercentExpansionTile extends StatelessWidget {
  final bool expanded;
  final GestureTapCallback onTap;

  const TipPercentExpansionTile({Key key, this.expanded, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tipProvider = context.watch<TipProvider>();

    return AppExpansionTile(
      expanded: expanded,
      onHeaderTap: onTap,
      header: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Tip %'),
          Text('${_formatPercent(tipProvider.tipPercent)}%'),
        ],
      ),
      children: <Widget>[
        buildOption(context, 10),
        buildOption(context, 15),
        buildOption(context, 20),
        buildOption(context, 25),
      ],
    );
  }

  String _formatPercent(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }

  Widget buildOption(BuildContext context, int value) {
    var tipProvider = Provider.of<TipProvider>(context);

    return ExpansionTileOption(
      text: '$value%',
      onTap: () {
        tipProvider.tipPercent = value.toDouble();
        onTap();
      },
    );
  }
}
