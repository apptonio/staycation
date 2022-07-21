import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeColors {
  static Color mint500 = const Color(0xff20C5B5);
  static Color mint400 = const Color(0xff40E0D0);
  static Color mint200 = const Color(0xffB7F2EF);
  static Color mint100 = const Color(0xffE9FBFA);
  static Color teal800 = const Color(0xff1A3440);
//TODO: add all colors

}

final TextTheme textTheme = TextTheme(
  headline1: GoogleFonts.roboto(
    fontSize: 96,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  ),
  headline2: GoogleFonts.roboto(
    fontSize: 72,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  ),
  headline3: GoogleFonts.roboto(
    fontSize: 48,
    fontWeight: FontWeight.w400,
  ),
//TODO: add all text styles
);

ThemeData theme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 8),
      primary: ThemeColors.mint400, // background (button) color
      onPrimary: Colors.white, // foreground (text) color
      textStyle: textTheme.button,
    ),
  ),
);
