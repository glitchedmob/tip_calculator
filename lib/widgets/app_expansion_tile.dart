import 'package:flutter/material.dart';
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';

class AppExpansionTile extends StatefulWidget {
  final Widget/*!*/ header;
  final List<Widget>/*!*/ children;
  final GestureTapCallback onHeaderTap;
  final bool/*!*/ expanded;

  const AppExpansionTile({
    Key key,
    this.header,
    this.children,
    this.onHeaderTap,
    this.expanded = false,
  }) : super(key: key);

  @override
  _AppExpansionTileState createState() => _AppExpansionTileState();
}

class _AppExpansionTileState extends State<AppExpansionTile> {
  final GlobalKey<ConfigurableExpansionTileState> expansionTileKey =
      GlobalKey();

  @override
  void didUpdateWidget(AppExpansionTile oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.expanded != widget.expanded) {
      expansionTileKey.currentState?.handleTap();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        color: Theme.of(context).colorScheme.secondary,
        child: ConfigurableExpansionTile(
          key: expansionTileKey,
          initiallyExpanded: widget.expanded,
          animatedWidgetFollowingHeader: GestureDetector(
            onTap: widget.onHeaderTap,
            behavior: HitTestBehavior.opaque,
            child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 11),
                child: Icon(Icons.expand_more),
              ),
            ),
          ),
          header: Expanded(
            child: GestureDetector(
              onTap: widget.onHeaderTap,
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: widget.header,
              ),
            ),
          ),
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Column(
                children: widget.children,
              ),
            )
          ],
        ),
      ),
    );
  }
}
