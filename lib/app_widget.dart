import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:fisio_app/app/modules/auth/repository/google_signin_repository.dart';
import 'app/core/blocs/home_screen_bloc.dart';
import 'app/core/extensions/theme_controller_extension.dart';
import 'app/flavors.dart';
import 'app/core/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'app/core/theme/flavor_banner.dart';
import 'app/modules/auth/bloc/auth_bloc.dart';

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
    return BlocProvider(
      blocs: [
        Bloc((i) => HomeScreenBloc()),
        Bloc((ii) => AuthBloc(Modular.get<IGoogleSignInRepository>())),
      ],
      dependencies: const [],
      child: AnimatedBuilder(
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
      ),
    );
  }
}
