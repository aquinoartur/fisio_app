import 'app/fisio_design_system/colors_palette/colors_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightMode() {
  return ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      backgroundColor: FisioColors.white,
    ),
    primaryColor: FisioColors.primaryColor,
    backgroundColor: FisioColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: FisioColors.primaryColor,
      selectionColor: FisioColors.primaryColor,
    ),
    textTheme: TextTheme(
      headline1: GoogleFonts.nunito(color: FisioColors.lowBlack),
      headline2: GoogleFonts.nunito(color: FisioColors.lowBlack),
      headline3: GoogleFonts.nunito(color: FisioColors.lowBlack),
      headline4: GoogleFonts.nunito(color: FisioColors.lowBlack),
      headline5: GoogleFonts.nunito(color: FisioColors.lowBlack),
      headline6: GoogleFonts.nunito(color: FisioColors.lowBlack),
      subtitle1: GoogleFonts.nunito(color: FisioColors.lowBlack),
      subtitle2: GoogleFonts.nunito(color: FisioColors.lowBlack),
      bodyText1: GoogleFonts.nunito(color: FisioColors.lowBlack),
      bodyText2: GoogleFonts.nunito(color: FisioColors.lowBlack),
      caption: GoogleFonts.nunito(color: FisioColors.lowBlack),
      button: GoogleFonts.nunito(color: FisioColors.lowBlack),
      overline: GoogleFonts.nunito(color: FisioColors.lowBlack),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.nunito(),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: FisioColors.primaryColor,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: FisioColors.primaryColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: FisioColors.primaryColor,
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

ThemeData darkMode() {
  return ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      backgroundColor: FisioColors.lowBlack,
    ),
    textTheme: TextTheme(
      headline1: GoogleFonts.nunito(color: FisioColors.white),
      headline2: GoogleFonts.nunito(color: FisioColors.white),
      headline3: GoogleFonts.nunito(color: FisioColors.white),
      headline4: GoogleFonts.nunito(color: FisioColors.white),
      headline5: GoogleFonts.nunito(color: FisioColors.white),
      headline6: GoogleFonts.nunito(color: FisioColors.white),
      subtitle1: GoogleFonts.nunito(color: FisioColors.white),
      subtitle2: GoogleFonts.nunito(color: FisioColors.white),
      bodyText1: GoogleFonts.nunito(color: FisioColors.white),
      bodyText2: GoogleFonts.nunito(color: FisioColors.white),
      caption: GoogleFonts.nunito(color: FisioColors.white),
      button: GoogleFonts.nunito(color: FisioColors.white),
      overline: GoogleFonts.nunito(color: FisioColors.white),
    ),
    hintColor: FisioColors.white,
    primaryColor: FisioColors.primaryColor,
    splashColor: FisioColors.lowBlack,
    backgroundColor: FisioColors.lowBlack,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    scaffoldBackgroundColor: FisioColors.lowBlack,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: FisioColors.primaryColor,
      selectionColor: FisioColors.primaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.nunito(color: FisioColors.white),
      labelStyle: GoogleFonts.nunito(color: FisioColors.white),
      floatingLabelStyle: GoogleFonts.nunito(color: FisioColors.white),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: FisioColors.primaryColor,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: FisioColors.primaryColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: FisioColors.primaryColor,
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

ThemeData admMode() {
  return ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      backgroundColor: FisioColors.lowBlack,
    ),
    textTheme: TextTheme(
      headline1: GoogleFonts.nunito(color: FisioColors.white),
      headline2: GoogleFonts.nunito(color: FisioColors.white),
      headline3: GoogleFonts.nunito(color: FisioColors.white),
      headline4: GoogleFonts.nunito(color: FisioColors.white),
      headline5: GoogleFonts.nunito(color: FisioColors.white),
      headline6: GoogleFonts.nunito(color: FisioColors.white),
      subtitle1: GoogleFonts.nunito(color: FisioColors.white),
      subtitle2: GoogleFonts.nunito(color: FisioColors.white),
      bodyText1: GoogleFonts.nunito(color: FisioColors.white),
      bodyText2: GoogleFonts.nunito(color: FisioColors.white),
      caption: GoogleFonts.nunito(color: FisioColors.white),
      button: GoogleFonts.nunito(color: FisioColors.white),
      overline: GoogleFonts.nunito(color: FisioColors.white),
    ),
    hintColor: FisioColors.white,
    primaryColor: FisioColors.primaryColor,
    splashColor: FisioColors.lowBlack,
    backgroundColor: FisioColors.lowBlack,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    scaffoldBackgroundColor: FisioColors.lowBlack,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: FisioColors.primaryColor,
      selectionColor: FisioColors.primaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.nunito(color: FisioColors.white),
      labelStyle: GoogleFonts.nunito(color: FisioColors.white),
      floatingLabelStyle: GoogleFonts.nunito(color: FisioColors.white),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: FisioColors.primaryColor,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: FisioColors.primaryColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: FisioColors.primaryColor,
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
