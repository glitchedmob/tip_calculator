import 'package:flutter/material.dart';
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';

class AppExpansionTile extends StatelessWidget {
  final Widget header;
  final List<Widget> children;

  const AppExpansionTile({Key key, this.header, this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        color: Theme.of(context).accentColor,
        child: ConfigurableExpansionTile(
          animatedWidgetFollowingHeader: Padding(
            padding: EdgeInsets.all(5),
            child: Icon(Icons.expand_more),
          ),
          header: Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: header,
            ),
          ),
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Column(
                children: children,
              ),
            )
          ],
        ),
      ),
    );
  }
}
