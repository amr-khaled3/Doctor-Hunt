import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class AppTheme {

  static final ThemeData lightTheme = ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: const Color(0x29677294),
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: const Color(0x29677294),
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: const Color(0x29677294),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 18,
      ),

      hintStyle: GoogleFonts.rubik(
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
    ),

    textTheme: TextTheme(
      titleMedium: GoogleFonts.rubik(
        fontWeight: FontWeight.w500,
        fontSize: 24,
        color: Color(0xff000000),
      ),

      // labelMedium:

    bodySmall: GoogleFonts.rubik(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.labelColor,
    ),

    labelLarge: GoogleFonts.rubik(
      fontWeight: FontWeight.w500,
      fontSize: 15,
      color: AppColors.primaryColor,
    ),

    labelMedium: GoogleFonts.rubik(
      fontWeight: FontWeight.w300,
      fontSize: 16,
      color: AppColors.labelColor,
    ),

    labelSmall: GoogleFonts.rubik(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: Color(0xff677294),
    ),
  )
  );

}