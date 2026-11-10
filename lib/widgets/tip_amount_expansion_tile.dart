import 'package:material_ui/material_ui.dart';

import 'package:provider/provider.dart';

import 'package:tip_calculator/provider/tip_provider.dart';
import 'package:tip_calculator/utils/money.dart';
import 'package:tip_calculator/widgets/app_expansion_tile.dart';
import 'package:tip_calculator/widgets/expansion_tile_option.dart';
import 'package:tip_calculator/widgets/value_row.dart';

class TipAmountExpansionTile extends StatelessWidget {
  final bool expanded;
  final GestureTapCallback onTap;

  const TipAmountExpansionTile({
    super.key,
    required this.expanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var tipProvider = context.watch<TipProvider>();

    return AppExpansionTile(
      expanded: expanded,
      onHeaderTap: onTap,
      header: ValueRow(
        label: 'Tip Amount',
        value: formatCents(tipProvider.tipAmount),
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
        tipProvider.roundTipAmountToNearest(value * 100);
        onTap();
      },
    );
  }
}
