import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget tileDrawer(
    {required Color color, required String string, required IconData icon}) {
  return ListTile(
    title: Text(
      string,
      style: GoogleFonts.nunito(
          color: color, fontSize: 16, fontWeight: FontWeight.w600),
    ),
    leading: Icon(
      icon,
      size: 20,
      color: color,
    ),
  );
}
