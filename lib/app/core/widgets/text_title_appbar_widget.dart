import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textTitleAppBar(Color colorA, Color colorB) => Text.rich(
      TextSpan(
        text: 'Fisio',
        style: GoogleFonts.nunito(
          color: colorA,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        children: [
          TextSpan(
            text: 'Testes ',
            style: GoogleFonts.nunito(
              color: colorB,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
