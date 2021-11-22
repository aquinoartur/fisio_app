import 'package:fisio_app/app/core/theme/fisio_theme_controller.dart';
import 'package:fisio_app/app/fisio_design_system/colors_palette/colors_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../flavors.dart';

class ColorsSchema {
  Color setDarkLightMode(BuildContext context) {
    final themeController = Modular.get<FisioThemeController>();
    return Flavor.isUser ? (themeController.isDark ? FisioColors.lowBlack : Colors.white) : FisioColors.lowBlack;
  }

  Color setLightDarktMode(BuildContext context) {
    final themeController = Modular.get<FisioThemeController>();
    return Flavor.isUser ? (themeController.isDark ? FisioColors.white : FisioColors.highBlack) : FisioColors.white;
  }
}
