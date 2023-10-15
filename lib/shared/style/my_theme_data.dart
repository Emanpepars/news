import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    cardColor: Colors.white,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(
        size: 25,
        color: Colors.black,
      ),
      toolbarHeight: 70,
      titleTextStyle: GoogleFonts.ptSerif(
          fontSize: 25, fontWeight: FontWeight.w700, color: Colors.black),
      backgroundColor: Colors.white,
      centerTitle: true,
      // elevation: 0,
      shape: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(22),
          bottomRight: Radius.circular(22),
        ),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
    ),
    textTheme: TextTheme(
      // pick category
      headlineLarge: GoogleFonts.ptSerif(
          fontSize: 35, fontWeight: FontWeight.w700, color: Colors.black),
      // category name
      headlineSmall: GoogleFonts.ptSerif(
          fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black),
      // author "details screen"
      headlineMedium: GoogleFonts.ptSerif(
          fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black),
      // title ,description ,content
      bodyMedium: GoogleFonts.ptSerif(
          fontSize: 16,
          fontWeight: FontWeight.w800,
          color: const Color(0xff707070)),
      bodyLarge: GoogleFonts.ptSerif(
          fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black),
      // publishedAt
      bodySmall: GoogleFonts.ptSerif(
        fontSize: 13,
        color: Colors.black45,
      ),
      //title
      titleLarge: GoogleFonts.ptSerif(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: const Color(0xff707070),
      ),
      //description
      titleMedium: GoogleFonts.ptSerif(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: Colors.black45,
      ),
      //author
      titleSmall: GoogleFonts.ptSerif(
        fontSize: 10,
        fontWeight: FontWeight.w800,
        color: Colors.black,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    cardColor: const Color(0xFF2C2C2C),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(
        size: 25,
        color: Colors.white,
      ),
      toolbarHeight: 70,
      titleTextStyle: GoogleFonts.ptSerif(
          fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white),
      backgroundColor: Colors.black,
      centerTitle: true,
      // elevation: 0,
      shape: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(22),
          bottomRight: Radius.circular(22),
        ),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
    ),
    textTheme: TextTheme(
      // pick category
      headlineLarge: GoogleFonts.ptSerif(
          fontSize: 35, fontWeight: FontWeight.w700, color: Colors.white),
      // category name
      headlineSmall: GoogleFonts.ptSerif(
          fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white),
      // author "details screen"
      headlineMedium: GoogleFonts.ptSerif(
          fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
      bodyLarge: GoogleFonts.ptSerif(
          fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white),
      // title ,description ,content
      bodyMedium: GoogleFonts.ptSerif(
          fontSize: 16, fontWeight: FontWeight.w800, color: Colors.white),
      // publishedAt
      bodySmall: GoogleFonts.ptSerif(
        fontSize: 13,
        color: const Color(0xFF919090),
      ),
      //title
      titleLarge: GoogleFonts.ptSerif(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: const Color(0xFFDAD6D6),
      ),
      //description
      titleMedium: GoogleFonts.ptSerif(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: const Color(0xFFDAD6D6),
      ),
      //author
      titleSmall: GoogleFonts.ptSerif(
        fontSize: 10,
        fontWeight: FontWeight.w800,
        color: const Color(0xFF8F8E8E),
      ),
    ),
  );
}
