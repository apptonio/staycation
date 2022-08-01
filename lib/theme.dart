//import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeColors {
  static Color black = const Color(0xff000000);
  static Color white = const Color(0xffFFFFFF);

  static Color gray800 = const Color(0xff3F3F3F);
  static Color gray700 = const Color(0xff535353);
  static Color gray600 = const Color(0xff666666);
  static Color gray500 = const Color(0xff7C7C7C);
  static Color gray400 = const Color(0xff909090);
  static Color gray300 = const Color(0xffADADAD);
  static Color gray200 = const Color(0xffCACACA);
  static Color gray100 = const Color(0xffE3E3E3);
  static Color gray50 = const Color(0xffF3F3F3);

  static Color mint600 = const Color(0xff1DB4A5);
  static Color mint500 = const Color(0xff20C5B5);
  static Color mint400 = const Color(0xff40E0D0);
  static Color mint200 = const Color(0xffB7F2EF);
  static Color mint100 = const Color(0xffE9FBFA);
  static Color mint50 = const Color(0xffF2FDFC);

  static Color teal800 = const Color(0xff1A3440);
  static Color teal700 = const Color(0xff314D51);
  static Color teaL600 = const Color(0xff4E7C82);
  static Color teal500 = const Color(0xff5D939B);

  static Color coral500 = const Color(0xffEF976B);
  static Color coral400 = const Color(0xffF3B08E);

  static Color red500 = const Color(0xffEF6B6B);
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
  headline4: GoogleFonts.roboto(
    fontSize: 34,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  headline5: GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.w400,
  ),
  headline6: GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  ),
  subtitle1: GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  ),
  subtitle2: GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  ),
  bodyText1: GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  ),
  bodyText2: GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  ),
  button: GoogleFonts.roboto(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.46,
    //textStyle: const TextStyle(fontFeatures:[FontFeature.enable('smcp')],
  ),
  caption: GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  ),
  overline: GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 1,
  ),
);

ThemeData theme = ThemeData(
  scaffoldBackgroundColor: ThemeColors.white,
  appBarTheme: AppBarTheme(
    color: ThemeColors.white,
    elevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 8),
      primary: ThemeColors.mint400, // background (button) color
      onPrimary: ThemeColors.white, // foreground (text) color
      textStyle: textTheme.button,
    ),
  ),
);
