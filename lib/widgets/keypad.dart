import 'package:flutter/material.dart';

class Keypad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildRow(children: <Widget>[
          buildButton(context, '7'),
          buildButton(context, '8'),
          buildButton(context, '9'),
        ]),
        buildRow(children: <Widget>[
          buildButton(context, '4'),
          buildButton(context, '5'),
          buildButton(context, '6'),
        ]),
        buildRow(children: <Widget>[
          buildButton(context, '1'),
          buildButton(context, '2'),
          buildButton(context, '3'),
        ]),
        buildRow(children: <Widget>[
          buildButton(context, 'AC', accent: true),
          buildButton(context, '0'),
          buildButton(
            context,
            'DEL',
            accent: true,
            child: Icon(Icons.backspace, size: 40),
          ),
        ]),
      ],
    );
  }

  Widget buildRow({List<Widget> children}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      ),
    );
  }

  Widget buildButton(BuildContext context, String command,
      {Widget child, bool accent = false}) {
    Widget content;

    if (child == null) {
      content = Text(command, style: TextStyle(fontSize: 25),);
    } else {
      content = child;
    }

    return SizedBox(
      width: 85,
      height: 85,
      child: FlatButton(
        shape: CircleBorder(),
        color: accent ? Theme.of(context).accentColor : Theme.of(context).primaryColor,
        child: content,
        onPressed: () {},
      ),
    );
  }

  onKeyPress() {}
}
