import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData mainThemeData() {
  return ThemeData(
      appBarTheme: AppBarTheme(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarIconBrightness: Brightness.light
          )
      ),
      primaryColor: Color.fromARGB(255, 74,20,140),
      backgroundColor:  Color.fromARGB(255, 74,20,140),
      accentColor:  Color.fromARGB(255, 74,20,140).withAlpha(28),
      scaffoldBackgroundColor:  Colors.white,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Color.fromARGB(255, 74,20,140),
        selectionColor: Color.fromARGB(255, 74,20,140),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: GoogleFonts.nunito(),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 74,20,140),
            )
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 74,20,140),
            )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 74,20,140),
            )
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.grey,
            )
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.red,
            )
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.red,
            )
        ),
      )
  );
}