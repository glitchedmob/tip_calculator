import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tip_calculator/provider/tip_provider.dart';
import 'package:tip_calculator/utils/money.dart';
import 'package:tip_calculator/widgets/app_expansion_tile.dart';
import 'package:tip_calculator/widgets/expansion_tile_option.dart';

class BillTotalExpansionTile extends StatelessWidget {
  final bool expanded;
  final GestureTapCallback? onTap;

  const BillTotalExpansionTile({
    Key? key,
    this.expanded = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tipProvider = context.watch<TipProvider>();

    return AppExpansionTile(
      expanded: expanded,
      onHeaderTap: onTap,
      header: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text('Total Amount'),
          Text(formatCents(tipProvider.billTotal)),
        ],
      ),
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text('Round Up To Nearest:'),
        ),
        _buildOption(context, 1),
        _buildOption(context, 5),
        _buildOption(context, 10),
      ],
    );
  }

  Widget _buildOption(BuildContext context, int value) {
    var tipProvider = context.watch<TipProvider>();

    return ExpansionTileOption(
      text: '\$$value',
      onTap: () {
        tipProvider.roundBillTotalToNearest(value * 100);
          onTap?.call();
      },
    );
  }
}
