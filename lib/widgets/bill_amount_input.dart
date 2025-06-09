import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:tip_calculator/provider/tip_provider.dart';
import 'package:tip_calculator/utils/money.dart';

class BillAmountInput extends StatelessWidget {
  const BillAmountInput({super.key});

  @override
  Widget build(BuildContext context) {
    var tipProvider = context.watch<TipProvider>();

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text('Bill Amount'),
          Padding(
            padding: const EdgeInsets.only(right: 35),
            child: Text(formatCents(tipProvider.billAmount)),
          ),
        ],
      ),
    );
  }
}
