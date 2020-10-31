import 'package:flutter/material.dart';

class ExpansionTileOption extends StatelessWidget {
  final String text;
  final GestureTapCallback onTap;

  const ExpansionTileOption({Key key, this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 3, color: Colors.black),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10, right: 45),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(text, style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
