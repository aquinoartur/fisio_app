import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'text_title_appbar_widget.dart';

class DefaultAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  DefaultAppBar() : preferredSize = const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return AppBar(
      toolbarHeight: 60,
      backgroundColor: Colors.white,
      title: textTitleAppBar(primaryColor),
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: primaryColor),
    );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;

  CustomAppBar({required this.title})
      : preferredSize = const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: GoogleFonts.nunito(color: primaryColor, fontSize: 18),
      ),
      iconTheme: IconThemeData(color: primaryColor),
    );
  }
}
