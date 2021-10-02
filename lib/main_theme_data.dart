import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData mainThemeData() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light),
    ),
    primaryColor: const Color.fromARGB(255, 74, 20, 140),
    backgroundColor: const Color.fromARGB(255, 74, 20, 140),
    colorScheme: ColorScheme(
      secondary: const Color.fromARGB(255, 74, 20, 140).withAlpha(28),
      surface: const Color.fromARGB(255, 74, 20, 140),
      primary: const Color.fromARGB(255, 74, 20, 140),
      onPrimary: const Color.fromARGB(255, 74, 20, 140),
      background: Colors.white,
      onSurface: Colors.white,
      secondaryVariant: Colors.white,
      error: Colors.red,
      onBackground: Colors.white,
      onSecondary: Colors.white,
      brightness: Brightness.light,
      onError: Colors.red,
      primaryVariant: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color.fromARGB(255, 74, 20, 140),
      selectionColor: Color.fromARGB(255, 74, 20, 140),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.nunito(),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 74, 20, 140),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 74, 20, 140),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 74, 20, 140),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: Colors.grey,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.red),
      ),
    ),
  );
}
