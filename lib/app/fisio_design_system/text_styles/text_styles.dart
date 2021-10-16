import '../colors_palette/colors_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static final TextStyle title1 =
      GoogleFonts.nunito(color: Colors.black87.withOpacity(.7), fontSize: 18, fontWeight: FontWeight.bold);

  static final TextStyle title2 = GoogleFonts.nunito(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);

  static final TextStyle cardtitle1 =
      GoogleFonts.nunito(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14);

  static final TextStyle cardtitle2 =
      GoogleFonts.nunito(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14);

  static final TextStyle cardtitle3 =
      GoogleFonts.nunito(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 12);

  static final TextStyle t4 =
      GoogleFonts.nunito(color: Colors.black87.withOpacity(.7), fontWeight: FontWeight.w600, fontSize: 16);

  static final TextStyle ts1 =
      GoogleFonts.nunito(color: const Color.fromARGB(255, 74, 20, 140), fontWeight: FontWeight.w600, fontSize: 24);

  static final TextStyle ts2 =
      GoogleFonts.nunito(fontSize: 18, color: Colors.black.withOpacity(.7), fontWeight: FontWeight.w800);

  static final TextStyle ts3 =
      GoogleFonts.nunito(fontSize: 16, color: Colors.black.withOpacity(.7), fontWeight: FontWeight.w600);

  static final TextStyle ts4 = GoogleFonts.nunito(color: Colors.white, fontSize: 20);
}

// ignore: non_constant_identifier_names
var RobotoStyle = GoogleFonts.roboto(color: Colors.black);

///Font Roboto
// ignore: non_constant_identifier_names
var RobotoColoredStyle = GoogleFonts.roboto(color: FisioColors.primaryColor, fontSize: 14);