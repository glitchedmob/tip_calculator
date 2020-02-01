import 'package:flutter/material.dart';

import 'package:tip_calculator/widgets/app_expansion_tile.dart';

class TipPercentExpansionTile extends StatelessWidget {
  final bool expanded;
  final GestureTapCallback onTap;

  const TipPercentExpansionTile({Key key, this.expanded, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppExpansionTile(
      expanded: expanded,
      onHeaderTap: onTap,
      header: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Tip %'),
          Text('20%'),
        ],
      ),
      children: <Widget>[
        Text('10%'),
        Text('15%'),
        Text('20%'),
        Text('25%'),
      ],
    );
  }
}
