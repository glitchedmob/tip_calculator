import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Primary = Color(0xff37474f);
const Background = Color(0xff000000);
const Accent = Color(0xffdc5b50);

ThemeData appTheme(BuildContext context) {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: Primary,
    backgroundColor: Background,
    scaffoldBackgroundColor: Background,
    accentColor: Colors.blue,
    textTheme: GoogleFonts.robotoMonoTextTheme(Typography.whiteMountainView),
  );
}
