import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  //below code provide the light theme
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: GoogleFonts.pacifico().fontFamily,
    //For giving App bar theme
        appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black),
            textTheme: Theme.of(context).textTheme),
      );
  //below code provide the dark theme
  static ThemeData darkTheme(BuildContext context) =>
      ThemeData(brightness: Brightness.dark);
}
