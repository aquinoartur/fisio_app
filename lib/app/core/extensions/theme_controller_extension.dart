import 'package:flutter_modular/flutter_modular.dart';

import '../core.dart';
import 'package:flutter/material.dart';

extension ThemeControllerExtension on BuildContext {
  /// Contains the FisioThemeController instance.
  FisioThemeController get theme => Modular.get<FisioThemeController>();
}
