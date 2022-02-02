import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primary = Color(0xff37474f);
const background = Color(0xff000000);
const accent = Color(0xffdc5b50);

ThemeData appTheme(BuildContext context) {
  final theme = Theme.of(context);

  return ThemeData(
    backgroundColor: background,
    scaffoldBackgroundColor: background,
    textTheme: GoogleFonts.robotoMonoTextTheme(Typography.whiteMountainView),
    colorScheme: theme.colorScheme.copyWith(
      primary: primary,
      secondary: Colors.blue,
      brightness: Brightness.dark,
    ),
  );
}
