import 'package:material_ui/material_ui.dart';

import 'package:google_fonts/google_fonts.dart';

const primary = Color(0xff212121);
const background = Color(0xff000000);
const accent = Color(0xffdc5b50);

ThemeData appTheme() {
  // Keep the original palette and text metrics, independent of any ancestor.
  final colors = ThemeData.light().colorScheme;

  return ThemeData(
    scaffoldBackgroundColor: background,
    textTheme: GoogleFonts.robotoMonoTextTheme(Typography.whiteMountainView),
    colorScheme: colors.copyWith(
      primary: primary,
      secondary: Colors.blue,
      brightness: Brightness.dark,
      surface: background,
    ),
  );
}
