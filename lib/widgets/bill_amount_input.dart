import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tip_calculator/provider/tip_provider.dart';
import 'package:tip_calculator/utils/money.dart';

class BillAmountInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tipProvider = context.watch<TipProvider>();

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Bill Amount'),
          Padding(
            padding: EdgeInsets.only(right: 35),
            child: Text(formatCents(tipProvider.billAmount)),
          ),
        ],
      ),
    );
  }
}
