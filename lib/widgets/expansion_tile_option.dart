import 'package:flutter/material.dart';

class ExpansionTileOption extends StatelessWidget {
  final String text;
  final GestureTapCallback? onTap;

  const ExpansionTileOption({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 3, color: Colors.black),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10, right: 45),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(text, style: const TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
