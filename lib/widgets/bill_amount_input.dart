import 'package:material_ui/material_ui.dart';

import 'package:provider/provider.dart';

import 'package:tip_calculator/provider/tip_provider.dart';
import 'package:tip_calculator/utils/money.dart';
import 'package:tip_calculator/widgets/value_row.dart';

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
      child: ValueRow(
        label: 'Bill Amount',
        value: formatCents(tipProvider.billAmount),
        trailingPadding: 35,
      ),
    );
  }
}
