import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:fisio_app/app/core/blocs/home_screen_bloc.dart';
import 'package:fisio_app/app/flavors.dart';
import 'package:fisio_app/main_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'app/core/theme/fisio_theme_controller.dart';
import 'app/core/theme/flavor_banner.dart';
import 'app/modules/auth/bloc/auth_bloc.dart';

class AppWidget extends StatefulWidget {
  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final botToastBuilder = BotToastInit();

  final themeController = Modular.get<FisioThemeController>();

  @override
  void initState() {
    super.initState();
    themeController.loadThemeMode().then((_) => setState);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => HomeScreenBloc()),
        Bloc((ii) => AuthBloc()),
      ],
      dependencies: const [],
      child: AnimatedBuilder(
        animation: themeController,
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
            theme: themeController.isDark ? darkMode() : lightMode(),
          ).modular();
        },
      ),
    );
  }
}
