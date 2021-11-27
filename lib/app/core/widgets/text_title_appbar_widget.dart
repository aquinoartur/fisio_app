import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textTitleAppBar(Color primaryColor, Color secondaryColor) => Text.rich(
      TextSpan(
        text: 'Fisio',
        style: GoogleFonts.nunito(
          color: primaryColor,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
        ),
        children: [
          TextSpan(
            text: 'Testes ',
            style: GoogleFonts.nunito(
              color: secondaryColor,
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
