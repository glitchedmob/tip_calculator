import 'package:flutter/material.dart';

class BillAmountInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            child: Text('\$50.00'),
          ),
        ],
      ),
    );
  }
}
