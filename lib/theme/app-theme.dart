// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/theme/app-colors.dart';

class AppTheming {
  static ThemeData LightTheme = ThemeData(
      cardTheme: CardTheme(
        color: AppColor.whiteColor,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: GoogleFonts.elMessiri(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showUnselectedLabels: false,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColor.PraimaryColor,
        selectedItemColor: AppColor.BlackColor,
        unselectedItemColor: AppColor.whiteColor,
      ),
      textTheme: TextTheme(
        bodyMedium: GoogleFonts.elMessiri(
            fontSize: 30,
            wordSpacing: 4,
            fontWeight: FontWeight.bold,
            color: AppColor.BlackColor),
        headlineLarge: GoogleFonts.elMessiri(
            fontSize: 30,
            wordSpacing: 4,
            fontWeight: FontWeight.bold,
            color: AppColor.BlackColor),
        headlineMedium: GoogleFonts.elMessiri(
            fontSize: 25,
            wordSpacing: 4,
            fontWeight: FontWeight.w400,
            color: AppColor.BlackColor),
        headlineSmall: GoogleFonts.elMessiri(
            fontSize: 25,
            wordSpacing: 4,
            fontWeight: FontWeight.w400,
            color: AppColor.BlackColor),
        labelMedium: GoogleFonts.elMessiri(
            fontSize: 30,
            wordSpacing: 4,
            fontWeight: FontWeight.bold,
            color: AppColor.BlackColor),
        labelLarge: GoogleFonts.elMessiri(
            fontSize: 30,
            wordSpacing: 4,
            fontWeight: FontWeight.bold,
            color: AppColor.whiteColor),
      ),
      dividerTheme:
          DividerThemeData(color: AppColor.PraimaryColor, thickness: 3),
      iconTheme: IconThemeData(
        color: AppColor.PraimaryColor,
      ),
      brightness: Brightness.light);

  ///////////////Darck Theme ///////////////////////////

  static ThemeData DarckTheme = ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: GoogleFonts.elMessiri(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColor.whiteColor),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showUnselectedLabels: false,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColor.DarchPraimaryColor,
        selectedItemColor: AppColor.YalowwColor,
        unselectedItemColor: AppColor.whiteColor,
      ),
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.elMessiri(
            fontSize: 30,
            wordSpacing: 4,
            fontWeight: FontWeight.bold,
            color: AppColor.whiteColor),
        headlineMedium: GoogleFonts.elMessiri(
            fontSize: 25,
            wordSpacing: 4,
            fontWeight: FontWeight.w400,
            color: AppColor.YalowwColor),
        headlineSmall: GoogleFonts.elMessiri(
            fontSize: 25, wordSpacing: 4, color: AppColor.whiteColor),
        labelLarge: GoogleFonts.elMessiri(
            fontSize: 30,
            wordSpacing: 4,
            fontWeight: FontWeight.bold,
            color: AppColor.BlackColor),
        labelMedium: GoogleFonts.elMessiri(
            fontSize: 30,
            wordSpacing: 4,
            fontWeight: FontWeight.bold,
            color: AppColor.whiteColor),
      ),
      dividerTheme: DividerThemeData(color: AppColor.YalowwColor, thickness: 3),
      iconTheme: IconThemeData(
        color: AppColor.YalowwColor,
      ),
      cardTheme: CardTheme(
        color: AppColor.DarchPraimaryColor,
      ),
      brightness: Brightness.dark);
}
