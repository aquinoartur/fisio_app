import '../core.dart';
import '../../fisio_design_system/fisio_design_system.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'text_title_appbar_widget.dart';
import '../extensions/theme_controller_extension.dart';

class DefaultAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  DefaultAppBar() : preferredSize = const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: context.theme,
      builder: (context, _) {
        return AppBar(
          toolbarHeight: 60,
          title: textTitleAppBar(
            context.theme.isDark ? FisioColors.primaryLightColor : FisioColors.primaryHighColor,
            context.theme.isDark ? FisioColors.white : FisioColors.highBlack,
          ),
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(color: FisioColors.primaryColor),
        );
      },
    );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  CustomAppBar({required this.title}) : preferredSize = const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: context.theme,
      builder: (context, _) {
        return AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            title,
            style: GoogleFonts.nunito(
              color: context.theme.isDark ? FisioColors.white : FisioColors.primaryColor,
              fontSize: 18,
            ),
          ),
          iconTheme: IconThemeData(
            color: context.theme.isDark ? FisioColors.white : FisioColors.primaryColor,
          ),
        );
      },
    );
  }
}
