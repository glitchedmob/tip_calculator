import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:tip_calculator/widgets/app_expansion_tile.dart';

class Display extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 45, bottom: 20),
          child: buildButton(context,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  buildText('Bill Amount'),
                  buildText('\$50.00'),
                ],
              )),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: AppExpansionTile(
            header: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                buildText('Tip %'),
                buildText('20%'),
              ],
            ),
            children: <Widget>[
              buildText('10%'),
              buildText('15%'),
              buildText('20%'),
              buildText('25%'),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: AppExpansionTile(
            header: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                buildText('Tip Amount'),
                buildText('\$10.00'),
              ],
            ),
            children: <Widget>[
              buildText('Round Up To:'),
              buildText('\$1'),
              buildText('\$5'),
              buildText('\$10'),
              buildText('\$15'),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: AppExpansionTile(
            header: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                buildText('Total Amount'),
                buildText('\$60.00'),
              ],
            ),
            children: <Widget>[
              buildText('Round Up To:'),
              buildText('\$1'),
              buildText('\$5'),
              buildText('\$10'),
              buildText('\$15'),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildText(String text) {
    return Text(text, style: TextStyle(fontSize: 20));
  }

  Widget buildButton(BuildContext context,
      {@required Widget child, EdgeInsets padding}) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      padding: padding == null ? EdgeInsets.all(10) : padding,
      child: child,
    );
  }
}
