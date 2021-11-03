import '../core.dart';
import '../../fisio_design_system/fisio_design_system.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'text_title_appbar_widget.dart';

class DefaultAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final themeController = Modular.get<FisioThemeController>();

  DefaultAppBar() : preferredSize = const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: themeController,
        builder: (context, _) {
          return AppBar(
            toolbarHeight: 60,
            title: textTitleAppBar(
              themeController.isDark ? FisioColors.primaryLightColor : FisioColors.highPrimaryColor,
              themeController.isDark ? FisioColors.white : FisioColors.highBlack,
            ),
            centerTitle: true,
            elevation: 0,
            iconTheme: const IconThemeData(color: FisioColors.primaryColor),
          );
        });
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  final themeController = Modular.get<FisioThemeController>();

  CustomAppBar({required this.title}) : preferredSize = const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeController,
      builder: (context, _) {
        return AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            title,
            style: GoogleFonts.nunito(
              color: themeController.isDark ? FisioColors.white : FisioColors.primaryColor,
              fontSize: 18,
            ),
          ),
          iconTheme: IconThemeData(
            color: themeController.isDark ? FisioColors.white : FisioColors.primaryColor,
          ),
        );
      },
    );
  }
}
