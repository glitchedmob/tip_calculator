import 'package:flutter/material.dart';

const Primary = Color(0xff37474f);
const Background = Color(0xff000000);
const Accent = Color(0xffdc5b50);

var appTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Primary,
  backgroundColor: Background,
  scaffoldBackgroundColor: Background,
  accentColor: Accent,
  textTheme: Typography.whiteMountainView,
);