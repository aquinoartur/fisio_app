import 'package:fisio_app/app/fisio_design_system/colors_palette/colors_palette.dart';
import 'package:flutter/material.dart';

class FlavorBannerWidget extends StatelessWidget {
  final Widget child;
  final bool isUser;
  const FlavorBannerWidget({Key? key, required this.child, this.isUser = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isUser) return child;
    return Stack(children: <Widget>[
      child,
      SizedBox(
        width: 50,
        height: 50,
        child: CustomPaint(
          painter: BannerPainter(
            message: 'Adm Mode',
            textDirection: Directionality.of(context),
            layoutDirection: Directionality.of(context),
            location: BannerLocation.topStart,
            color: FisioColors.primaryColor,
          ),
        ),
      ),
    ]);
  }
}
