import 'package:bot_toast/bot_toast.dart';
import 'app/core/extensions/theme_controller_extension.dart';
import 'app/flavors.dart';
import 'app/core/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'app/core/theme/flavor_banner.dart';

class AppWidget extends StatefulWidget {
  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final botToastBuilder = BotToastInit();
  @override
  void initState() {
    super.initState();
    context.theme.loadThemeMode().then((_) => setState);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: context.theme,
      builder: (context, _) {
        return MaterialApp(
          builder: (context, child) {
            child = asuka.builder(context, child);
            child = botToastBuilder(context, child);
            child = FlavorBannerWidget(
              child: child,
              isUser: Flavor.isUser,
            );
            return child;
          },
          navigatorObservers: [
            BotToastNavigatorObserver(),
          ],
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          theme: context.theme.isDark ? darkMode() : lightMode(),
        ).modular();
      },
    );
  }
}
