import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard/configs/constants.dart';

final appTheme = ThemeData(
   primaryColor: kWhite,

   textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
     headlineMedium: TextStyle(
       color: Colors.black,
       fontSize: 50,
       fontFamily: GoogleFonts.notoSans().fontFamily,
       fontWeight: FontWeight.bold
     )
   ),

  appBarTheme: AppBarTheme(
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontFamily: GoogleFonts.notoSans().fontFamily,
       fontSize: 20,
       fontWeight: FontWeight.bold
    ),
     color: kRed
  ),
  scaffoldBackgroundColor: kPink,

  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(kCircularBorderRadius),
    ),
    backgroundColor: kRed,
    titleTextStyle: TextStyle(
      fontFamily: GoogleFonts.notoSans().fontFamily,
      fontSize: 24,
      color: Colors.white,
    )
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kCircularBorderRadius),
        side: BorderSide(
          color: Colors.white,
        ),
      ),
      backgroundColor: kPink,
      textStyle: TextStyle(
        fontFamily: GoogleFonts.notoSans().fontFamily,
        color: Colors.white,
      )

    )
  ),

  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: kRed,
    linearTrackColor: Colors.grey
  )
);