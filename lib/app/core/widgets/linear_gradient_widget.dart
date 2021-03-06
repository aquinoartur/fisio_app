import '../extensions/theme_controller_extension.dart';

import '../../fisio_design_system/fisio_design_system.dart';
import 'package:flutter/material.dart';

class FirstLinearGradientWidget extends StatelessWidget {
  const FirstLinearGradientWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(end: Alignment.topCenter, begin: Alignment.bottomCenter, colors: [
        Colors.white.withOpacity(0.0),
        Colors.white.withOpacity(1),
        Colors.white,
      ])),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 6,
    );
  }
}

class SecLinearGradientWidget extends StatelessWidget {
  const SecLinearGradientWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withOpacity(0.0),
            Colors.white.withOpacity(0.8),
            Colors.white.withOpacity(0.999),
            context.theme.isDark ? FisioColors.lowBlack : FisioColors.primaryColor,
          ],
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.93,
    );
  }
}
