import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textTitleAppBar (Color color){
  return Text.rich(TextSpan(
      text: "Fisio",
      style: GoogleFonts.nunito(
          color: color,
          fontSize: 20,
          fontWeight: FontWeight.w600),
      children: [
        TextSpan(
            text: "Testes ",
            style: GoogleFonts.nunito(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.w600)),
      ]));
}