import 'package:flutter/material.dart';

import 'package:tip_calculator/widgets/app_expansion_tile.dart';

class BillTotalExpansionTile extends StatelessWidget {
  final bool expanded;
  final GestureTapCallback onTap;

  const BillTotalExpansionTile({Key key, this.expanded, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppExpansionTile(
      expanded: expanded,
      onHeaderTap: onTap,
      header: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Total Amount'),
          Text('\$60.00'),
        ],
      ),
      children: <Widget>[
        Text('Round Up To:'),
        Text('\$1'),
        Text('\$5'),
        Text('\$10'),
        Text('\$15'),
      ],
    );
  }
}
