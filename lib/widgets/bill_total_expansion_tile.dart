import 'package:flutter/material.dart';

import 'package:tip_calculator/widgets/app_expansion_tile.dart';
import 'package:tip_calculator/widgets/expansion_tile_option.dart';

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
