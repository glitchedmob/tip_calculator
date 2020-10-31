import 'package:flutter/material.dart';

import 'package:tip_calculator/widgets/bill_amount_input.dart';
import 'package:tip_calculator/widgets/bill_total_expansion_tile.dart';
import 'package:tip_calculator/widgets/tip_amount_expansion_tile.dart';
import 'package:tip_calculator/widgets/tip_percent_expansion_tile.dart';

class ResultDisplay extends StatefulWidget {
  @override
  _ResultDisplayState createState() => _ResultDisplayState();
}

class _ResultDisplayState extends State<ResultDisplay> {
  bool tipPercentExpanded = false;
  bool tipAmountExpanded = false;
  bool totalAmountExpanded = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.body1.copyWith(fontSize: 20),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 45, bottom: 20),
            child: BillAmountInput(),
          ),
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: TipPercentExpansionTile(
                expanded: tipPercentExpanded,
                onTap: () {
                  setState(() {
                    tipPercentExpanded = !tipPercentExpanded;

                    tipAmountExpanded = false;
                    totalAmountExpanded = false;
                  });
                },
              )),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: TipAmountExpansionTile(
              expanded: tipAmountExpanded,
              onTap: () {
                setState(() {
                  tipAmountExpanded = !tipAmountExpanded;

                  tipPercentExpanded = false;
                  totalAmountExpanded = false;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: BillTotalExpansionTile(
              expanded: totalAmountExpanded,
              onTap: () {
                setState(() {
                  totalAmountExpanded = !totalAmountExpanded;

                  tipPercentExpanded = false;
                  tipAmountExpanded = false;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
