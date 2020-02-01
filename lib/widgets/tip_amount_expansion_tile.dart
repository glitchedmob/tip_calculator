import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tip_calculator/provider/tip_provider.dart';
import 'package:tip_calculator/utils/money.dart';
import 'package:tip_calculator/widgets/app_expansion_tile.dart';
import 'package:tip_calculator/widgets/expansion_tile_option.dart';

class TipAmountExpansionTile extends StatelessWidget {
  final bool expanded;
  final GestureTapCallback onTap;

  const TipAmountExpansionTile({Key key, this.expanded, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tipProvider = Provider.of<TipProvider>(context);

    return AppExpansionTile(
      expanded: expanded,
      onHeaderTap: onTap,
      header: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Tip Amount'),
          Text(formatCents(tipProvider.tipAmount)),
        ],
      ),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text('Round Up To Nearest:'),
        ),
        buildOption(1),
        buildOption(5),
        buildOption(10),
        buildOption(15),
      ],
    );
  }

  Widget buildOption(value) {
    return ExpansionTileOption(
      text: '\$$value',
      onTap: () {},
    );
  }
}
